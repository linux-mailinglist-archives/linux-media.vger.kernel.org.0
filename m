Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8845107F6A
	for <lists+linux-media@lfdr.de>; Sat, 23 Nov 2019 17:46:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726869AbfKWQqR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Nov 2019 11:46:17 -0500
Received: from smtp-out-so.shaw.ca ([64.59.136.139]:37148 "EHLO
        smtp-out-so.shaw.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726820AbfKWQqQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Nov 2019 11:46:16 -0500
Received: from shaw.ca ([70.71.78.228])
        by shaw.ca with ESMTPA
        id YYXziRYDERnrKYYY3iYY1A; Sat, 23 Nov 2019 09:46:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shaw.ca;
        s=s20180605; t=1574527575;
        bh=tgLrh+iaKB9+zqsMp8DhAXMSnYDt1IxAnf2Ur9H9HPU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Mg7+Z/UVpXN8COZ1yUggUwXucuEkADxhs8YRh+IWsezma1TOglL9v1H+9FjZYsD7N
         w5L677LhLUj3c9ZVps8AzLzLX3w0EvD0iY6+8OAA9UfndXqVyWtAETFGtUnKIqj8jZ
         DYsLQNthgq5mpMemOfMOvpAMQUQkCixTuDo3tmcngwJoX9FxHjtrq20+SO1IL/8tXe
         sOuZ6dL0AjqZcWYHtHwU3A7EzNLpkKNMkiYg5CR/0a9+MNMgsPI3yqavyk/ULQKA/a
         Xa7HNoVnH8EvcPRwUwpGCpz8p8F+bwmv7zTHjJuwZeiy7c/99KQQn4DuznQn93lWLz
         X5j0WakjTl5FQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shaw.ca;
        s=s20180605; t=1574527575;
        bh=tgLrh+iaKB9+zqsMp8DhAXMSnYDt1IxAnf2Ur9H9HPU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Mg7+Z/UVpXN8COZ1yUggUwXucuEkADxhs8YRh+IWsezma1TOglL9v1H+9FjZYsD7N
         w5L677LhLUj3c9ZVps8AzLzLX3w0EvD0iY6+8OAA9UfndXqVyWtAETFGtUnKIqj8jZ
         DYsLQNthgq5mpMemOfMOvpAMQUQkCixTuDo3tmcngwJoX9FxHjtrq20+SO1IL/8tXe
         sOuZ6dL0AjqZcWYHtHwU3A7EzNLpkKNMkiYg5CR/0a9+MNMgsPI3yqavyk/ULQKA/a
         Xa7HNoVnH8EvcPRwUwpGCpz8p8F+bwmv7zTHjJuwZeiy7c/99KQQn4DuznQn93lWLz
         X5j0WakjTl5FQ==
X-Authority-Analysis: v=2.3 cv=L7FjvNb8 c=1 sm=1 tr=0
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=_Dj-zB-qAAAA:8 a=949wn93ibDxs2xV9dCkA:9
 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, joevt <joevt@shaw.ca>
Subject: [PATCH 02/10] edid-decode: correct horizontal range in Monitor Ranges
Date:   Sat, 23 Nov 2019 08:45:56 -0800
Message-Id: <20191123164604.268-3-joevt@shaw.ca>
X-Mailer: git-send-email 2.21.0 (Apple Git-122.2)
In-Reply-To: <20191123164604.268-1-joevt@shaw.ca>
References: <20191123164604.268-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfOY6nnjBSesckqm77OB5dyWnLm6UQqNHBC7vZ047/8VRMvM6rNflFdVjf6nubFnhlRqoWuSaML5TpDL7gY6UtKQ9Pk5mYHLY/Ck9TSN39sE3kukH3vL+
 3vxf2yAYlkIAJKUDOtsw1JO9FDvEwO4CMcloVDH5RyAXMv0G7K9p+3yC/+wlJXV5bal3MLmvPjTsW9WVRaM91d6qU+HCWJvN14g=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Broken since commit 1508f040.
The max and min horizontal frequency in the "Monitor ranges" descriptor is to be offset by 255 when bit 3 and bit 2 are set, respectively.

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 edid-decode.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/edid-decode.c b/edid-decode.c
index 4ba0808..b2e57a3 100644
--- a/edid-decode.c
+++ b/edid-decode.c
@@ -863,9 +863,9 @@ static int detailed_block(const unsigned char *x, int in_extension)
 						v_min_offset = 255;
 					}
 				}
-				if (x[4] & 0x04) {
+				if (x[4] & 0x08) {
 					h_max_offset = 255;
-					if (x[4] & 0x03) {
+					if (x[4] & 0x04) {
 						h_min_offset = 255;
 					}
 				}
-- 
2.21.0 (Apple Git-122.2)

