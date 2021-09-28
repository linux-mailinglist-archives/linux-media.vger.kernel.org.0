Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D459E41AD24
	for <lists+linux-media@lfdr.de>; Tue, 28 Sep 2021 12:38:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240190AbhI1KkR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Sep 2021 06:40:17 -0400
Received: from omta001.cacentral1.a.cloudfilter.net ([3.97.99.32]:47033 "EHLO
        omta001.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240177AbhI1KkR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Sep 2021 06:40:17 -0400
Received: from shw-obgw-4004a.ext.cloudfilter.net ([10.228.9.227])
        by cmsmtp with ESMTP
        id UwjamiW1TczbLVAVRmcz2E; Tue, 28 Sep 2021 10:38:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1632825517; bh=THiIQYzt387+2gPJ0WXJlEE91FlNkaKVJZxVSF9I7vI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=r+OkGnuv+LIQ8G5XXLs/34ao9AlRtyPnj4zTxLQ7IkCARvhFfekGn2/vv3o5cK1La
         Nsrs9cu9qwIZcpRMrvm/DSgUCnQ+9CHmjTyNygltLWm6ClRrav34LSMTFkPr7Lh6Du
         cWmUuytllsldBRkck91GrOJkFbcasQMpHNyN+olLiZ/+AxtblkUfUGFGtVPkifMYux
         2YP0zmLRBkWWX06AIuiKH1U4d2gzlQNdnmmYBIxtSB04pKLDRjPvtcyakoP2vd8FC9
         jgm9CtUSxbpv6sO+tMRNo35DOFA7cl8DBhBf8WbAOtue3Ug3/5JhW86nDH5/3fZwLE
         8feFw5SNeHklg==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id VAVOm7MUwdCHGVAVRmF4AZ; Tue, 28 Sep 2021 10:38:37 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=SdyUytdu c=1 sm=1 tr=0 ts=6152f0ad
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17 a=_Dj-zB-qAAAA:8
 a=V-7VWGlF9ycRYLkGX24A:9 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH 2/2] edid-decode: output correct unknown block length
Date:   Tue, 28 Sep 2021 03:38:34 -0700
Message-Id: <20210928103834.2186-3-joevt@shaw.ca>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210928103834.2186-1-joevt@shaw.ca>
References: <20210928103834.2186-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfLltxFs50+X+rAAaOjL03auIJnlb5XGbI/ltCgsiYvbpHEHSQq/h9OBfXYqv5uc9slJZCy2J522OHV0zMV+3hCO30DclEoMD5i+FHlpYhcRdP8plhnch
 bzxV5aGNAT4c7z9Ub2HCBMnByoMTWp1oJnHJUjdeb7MIjs2KzCKvCXFHlepjYF9D4PVS2pRxXZjmXbXefixwIEE+E+471u0Whfk=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The correct length of a DisplayID block is len. It is the number of bytes in the payload bytes (doesn't include the tag or length or revision). It may include the OUI but we don't output the OUI in hex_block, and an unknown block can't have an OUI unless there's a new DisplayID spec with a new type of block that we don't know about.

The length parameter passed to displayid_block is the number of bytes that remain in a DisplayID extension block (maybe it needs to be renamed?). We pass it to displayid_block so it can handle length related errors. displayid_block handles all interpretation of the data block. The only byte we know that can be interpreted on entry is the tag byte because it is the first byte and length is at least one (according to the for loop in parse_displayid_block).
The payload length byte occurs after the tag byte - it might exist beyond the limit of length. If that's the case, we can at least report the tag block type with the error, but we choose not to. Instead, we output the rest of the bytes (including the tag) as hex because it probably isn't a real block.

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 parse-displayid-block.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/parse-displayid-block.cpp b/parse-displayid-block.cpp
index b318766..c8cea53 100644
--- a/parse-displayid-block.cpp
+++ b/parse-displayid-block.cpp
@@ -1711,7 +1711,7 @@ unsigned edid_state::displayid_block(const unsigned version, const unsigned char
 	// 0x80 RESERVED
 	case 0x81: data_block = "CTA-861 DisplayID Data Block"; break;
 	// 0x82 .. 0xff RESERVED
-	default:   data_block = "Unknown DisplayID Data Block (" + utohex(tag) + ", length " + std::to_string(length) + ")"; break;
+	default:   data_block = "Unknown DisplayID Data Block (" + utohex(tag) + ", length " + std::to_string(len) + ")"; break;
 	}
 
 	if (length < 3) {
-- 
2.24.3 (Apple Git-128)

