Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 558B23173CB
	for <lists+linux-media@lfdr.de>; Wed, 10 Feb 2021 23:58:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233753AbhBJW6G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Feb 2021 17:58:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:51874 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233741AbhBJW6D (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Feb 2021 17:58:03 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D51F764EBB;
        Wed, 10 Feb 2021 22:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612997842;
        bh=UJfsvvn0ix5B2B8amG6o871cR0JpZNABhACiEZxCNac=;
        h=Date:From:To:Cc:Subject:From;
        b=ufNE5DNDh1Nz18RJZvqyxD8pqzzCI4sLMwzCHcu7bd4gyZbGlSGs7hl1FGfbrLhCN
         TTtlr0jUuqQoiHt2McjjzMx9UD+zdntHOEkwpDeHXgekdkKtEvrplPYebrNktNFrO7
         t38XpKrUzE8xhGYENhtb7ByvdhqLzdpDCNSITuMfFrrquD3m8HIDOete+TTEXnKJpM
         dLHzgQU5A4fpLVbxuoAmhTVJmSKpxq1Z5plbKZ60beAO4OW2i8GANro1lLM4530d48
         xS1oTmKteX6WCMoBJSzTGGLuulB1ZYX+EISCVqdt6hzTMR6U9t7cDoll9in8HTKmVL
         MJ+jlPlu0NbQQ==
Date:   Wed, 10 Feb 2021 16:57:20 -0600
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-hardening@vger.kernel.org
Subject: [PATCH][next] media: venus: hfi_cmds.h: Replace one-element array
 with flexible-array member
Message-ID: <20210210225720.GA13710@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is a regular need in the kernel to provide a way to declare having
a dynamically sized set of trailing elements in a structure. Kernel code
should always use “flexible array members”[1] for these cases. The older
style of one-element or zero-length arrays should no longer be used[2].

Use flexible-array member in struct hfi_sys_set_property_pkt instead of
one-element array.

Also, this helps with the ongoing efforts to enable -Warray-bounds and
fix the following warnings:

drivers/media/platform/qcom/venus/hfi_cmds.c: In function ‘pkt_sys_coverage_config’:
drivers/media/platform/qcom/venus/hfi_cmds.c:57:11: warning: array subscript 1 is above array bounds of ‘u32[1]’ {aka ‘unsigned int[1]’} [-Warray-bounds]
   57 |  pkt->data[1] = mode;
      |  ~~~~~~~~~^~~

[1] https://en.wikipedia.org/wiki/Flexible_array_member
[2] https://www.kernel.org/doc/html/v5.9/process/deprecated.html#zero-length-and-one-element-arrays

Link: https://github.com/KSPP/linux/issues/79
Link: https://github.com/KSPP/linux/issues/109
Build-tested-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/lkml/602416da.iZqae7Dbk7nyl6OY%25lkp@intel.com/
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/media/platform/qcom/venus/hfi_cmds.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
index 83705e237f1c..327ed90a2788 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.h
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
@@ -68,7 +68,7 @@ struct hfi_sys_release_resource_pkt {
 struct hfi_sys_set_property_pkt {
 	struct hfi_pkt_hdr hdr;
 	u32 num_properties;
-	u32 data[1];
+	u32 data[];
 };
 
 struct hfi_sys_get_property_pkt {
-- 
2.27.0

