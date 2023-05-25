Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29626710D4F
	for <lists+linux-media@lfdr.de>; Thu, 25 May 2023 15:36:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241302AbjEYNg3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 May 2023 09:36:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231397AbjEYNg1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 May 2023 09:36:27 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECF1E191
        for <linux-media@vger.kernel.org>; Thu, 25 May 2023 06:36:25 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-510f525e06cso4466584a12.2
        for <linux-media@vger.kernel.org>; Thu, 25 May 2023 06:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google; t=1685021784; x=1687613784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sOJf2vsZCc6FCI4oDdk0qO3/TAVZBTliNjoqHec/fdk=;
        b=Av1KGgt+dVsbo5JLHnmVI5gVuCxbgggyPa5QHFFhHY2hXxIye9lXPXhJEMdGohCtfP
         Ox9Gtly+qIJgq/7KoQC150+7UfB2nHZh+4/u/h2Unv2NMftvyEhyZxi2LXPLqn6jq+g4
         lKBnamn5xZ0W1UsEe+/WvWeuZ3/s+LnIBoZC8MWqriy/gD7Sf4+O8C31IE0qAaN6uKKh
         cwN0PQx8LAP49Be7P7cdqbXE6eHjMfKCbLJ1zNuU+L0nCeqmOca2YLqBS1dGD+CSZhZT
         SZUt4y416X2tZ2KVebSH1iA2pytT70Y9OePtpn0J2X4ekLnYiuLnZWs6OplDDSMpzmEq
         0SNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685021784; x=1687613784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sOJf2vsZCc6FCI4oDdk0qO3/TAVZBTliNjoqHec/fdk=;
        b=UdC3jrLp1c5uAuBmNSbm45ua/VJCeMxhO5gz2ti6/bAxpS1YvPgX8mCNVcGB1I7v1K
         SW+fZ71YjPqlWPf4Ih0C8BQJuxbfBG/F3BrovSbyy4OCnTcYbm2+kiBjfVw/OJMbC0Gb
         +XBNQTgpUDTAvxjXJdJ/NtMKw0jSLlXa6nIhU1WEOHDzy470/Tzn0xMg96LtlAx7j6K7
         piW5B5+InmR+nfvtGPPjIP7mK+M4jLdgGe/Gi8EILsWsBvPHul6DA8FZuR0QAmK0502p
         PtntVTpf1HbZ2tXw5DWMJXWTFTpki7SQz2sQDT6nwMY/gyT867IE0NNXwYjd8UKcN/4V
         IQvg==
X-Gm-Message-State: AC+VfDylZdcMhf7zAJMVeEuNAOjgCz8pejuViw+nmY0c6qRpdfyo2R2q
        CSF+OFffPCippyS8uyZoFliOC+dak75t40+tHJhNOZvu2/XcMrkFCCSfI8bDrZ71KDPV0gsMrzR
        piAxvAL6L1KU4+puyAJbTx+0kieTc7hV3I7QyXQpCIaYbfS5TncFmqJrM6qzfFsOSITlHsxHY
X-Google-Smtp-Source: ACHHUZ7GNp1sCTHrAxqkXIub7Qxrthx9U4IMYSVzR7Yr3KyElNUr186zk+rmGW4ZpLKgoFff2SnU7A==
X-Received: by 2002:a17:907:3e9b:b0:966:3de0:8998 with SMTP id hs27-20020a1709073e9b00b009663de08998mr1524612ejc.73.1685021784161;
        Thu, 25 May 2023 06:36:24 -0700 (PDT)
Received: from dlp-nixos.qtec.com (cpe.ge-3-0-8-100.ryvnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id u5-20020a17090626c500b0096f641a4c01sm853873ejc.179.2023.05.25.06.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 06:36:23 -0700 (PDT)
From:   Daniel Lundberg Pedersen <dlp@qtec.com>
To:     linux-media@vger.kernel.org
Cc:     Daniel Lundberg Pedersen <dlp@qtec.com>
Subject: [PATCH] v4l2-ctl: Add --get/--set-ctrl support for INTEGER and INTEGER64 arrays
Date:   Thu, 25 May 2023 15:35:59 +0200
Message-Id: <20230525133559.211048-1-dlp@qtec.com>
X-Mailer: git-send-email 2.38.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for INTEGER and INTEGER64 arrays.

Also print error if trying to print unkown array type

Signed-off-by: Daniel Lundberg Pedersen <dlp@qtec.com>
---
NOTE: This patch depends on the fixed pointer types for p_s32 and p_s64
from this patch:
https://lore.kernel.org/linux-media/20230501145707.4088026-2-dlp@qtec.com/

 utils/v4l2-ctl/v4l2-ctl-common.cpp | 34 +++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
index a1cc93c825c8..d753f64d8e30 100644
--- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
@@ -472,6 +472,26 @@ static void print_array(const v4l2_query_ext_ctrl &qc, const v4l2_ext_control &c
 			}
 			printf("\n");
 			break;
+		case V4L2_CTRL_TYPE_INTEGER:
+			for (i = from; i <= to; i++) {
+				printf("%10i", ctrl.p_s32[idx + i]);
+				if (i < to)
+					printf(", ");
+			}
+			printf("\n");
+			break;
+		case V4L2_CTRL_TYPE_INTEGER64:
+			for (i = from; i <= to; i++) {
+				printf("%12lli", ctrl.p_s64[idx + i]);
+				if (i < to)
+					printf(", ");
+			}
+			printf("\n");
+			break;
+		default:
+			fprintf(stderr, "%s: unsupported array type\n",
+					qc.name);
+			break;
 		}
 	}
 }
@@ -1149,6 +1169,18 @@ void common_set(cv4l_fd &_fd)
 						if (idx_in_subset(qc, subset, divide, i))
 							ctrl.p_u32[i] = v;
 					break;
+				case V4L2_CTRL_TYPE_INTEGER:
+					v = strtol(set_ctrl.second.c_str(), nullptr, 0);
+					for (i = 0; i < qc.elems; i++)
+						if (idx_in_subset(qc, subset, divide, i))
+							ctrl.p_s32[i] = v;
+					break;
+				case V4L2_CTRL_TYPE_INTEGER64:
+					v = strtol(set_ctrl.second.c_str(), nullptr, 0);
+					for (i = 0; i < qc.elems; i++)
+						if (idx_in_subset(qc, subset, divide, i))
+							ctrl.p_s64[i] = v;
+					break;
 				case V4L2_CTRL_TYPE_STRING:
 					strncpy(ctrl.string, set_ctrl.second.c_str(), qc.maximum);
 					ctrl.string[qc.maximum] = 0;
--
2.38.5

