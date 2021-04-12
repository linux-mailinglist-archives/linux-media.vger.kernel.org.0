Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EA1435D2F4
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 00:20:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241931AbhDLWVE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 18:21:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240210AbhDLWVE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 18:21:04 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D39BDC061574;
        Mon, 12 Apr 2021 15:20:45 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id o5so16044626qkb.0;
        Mon, 12 Apr 2021 15:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=SDIMIsHgzIN3pPXc6C7qelFOQfB8Xs0e1yxPYg32Ijo=;
        b=MqpMQtteU02K/j2eR+5kdYN/xoJuPYDBCPxbsjWuO2tg4H3elwt06EP3PebPWgr45b
         unCvpzIoB42Vef6++HPU9ihfOVo5b6soR0Xbo5AI5n/vIMu6hk0d1KSuHKyIx3OX5gt8
         HitkgKDqroE3HBAWyIYU1Hl7/0YedB7bI7mORLzVuoMIHZ/z6RhxfIRQRWmYUF4ud7dO
         Uv9gn23JyrwbRoCnqfYdRMiiLSPuQnNupgfqhlB6CLnr0uOztpbW2XIbsCwRtpBkW4PG
         i8eDNTDwiGz3AzqAaALVIOYa2FlOT2HFIVOzv5RZYrMGaubW1NWSORputKspidOD6iIq
         aT6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=SDIMIsHgzIN3pPXc6C7qelFOQfB8Xs0e1yxPYg32Ijo=;
        b=AK3oMkEUURsSpfaZe0YJt+XgUYof6o1qVj6/u6j6GN3hBQ62ltdW6+Det3gyWncRzQ
         +7J4CzwILQcw+QFXXEm1vRGiMBzSPQHVSis1VasI/kNeVFND4tJMfNSQqvU5r/WR+lLY
         h8bmCwgGbCNZE+PZlHeGc3yxFVIofJK/FNONGGTzfCzeM9J5bbWl6UFLafN0sl8A1vuo
         tekiE4f+Ug26CYmyEH90w1B2LW5py4dotCFDePRNsDH6fa75zKLmeRGW3SZ3YiOUO5Vw
         8Z5Ce9xaGl4+aY/kjoDK8RQKHmDY7X/kLwx5euoC3nFW9EFQaWDXM4WEqISU2cEeYWQs
         pBIg==
X-Gm-Message-State: AOAM533hQRjgv0a1QTDOdiy6DP4uM27fiDm0cQ7pSgyk77WD6svjVH4M
        ZTTSZAq4X8aPaB8K/O68rK0=
X-Google-Smtp-Source: ABdhPJxelVv1UphO6h1ypfQ0NognyM4+QIrG0xolpdmjBgV8pr+/gNeDMevByEmUBXoWzw83tFAAwg==
X-Received: by 2002:ae9:e518:: with SMTP id w24mr28923415qkf.78.1618266044638;
        Mon, 12 Apr 2021 15:20:44 -0700 (PDT)
Received: from focaruja ([2001:1284:f016:a037:3782:dcd2:d032:5ca8])
        by smtp.gmail.com with ESMTPSA id f12sm8839781qti.63.2021.04.12.15.20.43
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Mon, 12 Apr 2021 15:20:44 -0700 (PDT)
Date:   Mon, 12 Apr 2021 19:20:40 -0300
From:   Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [PATCH] staging: media: tegra-vde: Align line break to match with
 the open parenthesis in file trace.h
Message-ID: <20210412222040.GA13659@focaruja>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Align line break to match with the open parenthesis.
Issue detected by checkpatch.pl.
It consequently solved a few end lines with a '(',
issue also detected by checkpatch.pl

Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
---
 drivers/staging/media/tegra-vde/trace.h | 111 ++++++++++++++------------------
 1 file changed, 50 insertions(+), 61 deletions(-)

diff --git a/drivers/staging/media/tegra-vde/trace.h b/drivers/staging/media/tegra-vde/trace.h
index e571410..1fcc573 100644
--- a/drivers/staging/media/tegra-vde/trace.h
+++ b/drivers/staging/media/tegra-vde/trace.h
@@ -11,79 +11,68 @@
 #include "vde.h"
 
 DECLARE_EVENT_CLASS(register_access,
-	TP_PROTO(struct tegra_vde *vde, void __iomem *base,
-		 u32 offset, u32 value),
-	TP_ARGS(vde, base, offset, value),
-	TP_STRUCT__entry(
-		__string(hw_name, tegra_vde_reg_base_name(vde, base))
-		__field(u32, offset)
-		__field(u32, value)
-	),
-	TP_fast_assign(
-		__assign_str(hw_name, tegra_vde_reg_base_name(vde, base));
-		__entry->offset = offset;
-		__entry->value = value;
-	),
-	TP_printk("%s:0x%03x 0x%08x", __get_str(hw_name), __entry->offset,
-		  __entry->value)
+		    TP_PROTO(struct tegra_vde *vde, void __iomem *base,
+			     u32 offset, u32 value),
+		    TP_ARGS(vde, base, offset, value),
+			    TP_STRUCT__entry(__string(hw_name, tegra_vde_reg_base_name(vde, base))
+					     __field(u32, offset)
+					     __field(u32, value)
+			    ),
+			    TP_fast_assign(__assign_str(hw_name,
+							tegra_vde_reg_base_name(vde, base));
+					   __entry->offset = offset;
+					   __entry->value = value;
+			    ),
+			    TP_printk("%s:0x%03x 0x%08x", __get_str(hw_name), __entry->offset,
+				      __entry->value)
 );
 
 DEFINE_EVENT(register_access, vde_writel,
-	TP_PROTO(struct tegra_vde *vde, void __iomem *base,
-		 u32 offset, u32 value),
-	TP_ARGS(vde, base, offset, value));
+	     TP_PROTO(struct tegra_vde *vde, void __iomem *base,
+		      u32 offset, u32 value),
+	     TP_ARGS(vde, base, offset, value));
 DEFINE_EVENT(register_access, vde_readl,
-	TP_PROTO(struct tegra_vde *vde, void __iomem *base,
-		 u32 offset, u32 value),
-	TP_ARGS(vde, base, offset, value));
+	     TP_PROTO(struct tegra_vde *vde, void __iomem *base,
+		      u32 offset, u32 value),
+	     TP_ARGS(vde, base, offset, value));
 
 TRACE_EVENT(vde_setup_iram_entry,
-	TP_PROTO(unsigned int table, unsigned int row, u32 value, u32 aux_addr),
-	TP_ARGS(table, row, value, aux_addr),
-	TP_STRUCT__entry(
-		__field(unsigned int, table)
-		__field(unsigned int, row)
-		__field(u32, value)
-		__field(u32, aux_addr)
-	),
-	TP_fast_assign(
-		__entry->table = table;
-		__entry->row = row;
-		__entry->value = value;
-		__entry->aux_addr = aux_addr;
-	),
-	TP_printk("[%u][%u] = { 0x%08x (flags = \"%s\", frame_num = %u); 0x%08x }",
-		  __entry->table, __entry->row, __entry->value,
-		  __print_flags(__entry->value, " ", { (1 << 25), "B" }),
-		  __entry->value & 0x7FFFFF, __entry->aux_addr)
+	    TP_PROTO(unsigned int table, unsigned int row, u32 value, u32 aux_addr),
+	    TP_ARGS(table, row, value, aux_addr),
+		    TP_STRUCT__entry(__field(unsigned int, table)
+				     __field(unsigned int, row)
+				     __field(u32, value)
+				     __field(u32, aux_addr)
+		    ),
+		    TP_fast_assign(__entry->table = table;
+				   __entry->row = row;
+				   __entry->value = value;
+				   __entry->aux_addr = aux_addr;
+		    ),
+		    TP_printk("[%u][%u] = { 0x%08x (flags = \"%s\", frame_num = %u); 0x%08x }",
+			      __entry->table, __entry->row, __entry->value,
+			      __print_flags(__entry->value, " ", { (1 << 25), "B" }),
+			      __entry->value & 0x7FFFFF, __entry->aux_addr)
 );
 
 TRACE_EVENT(vde_ref_l0,
-	TP_PROTO(unsigned int frame_num),
-	TP_ARGS(frame_num),
-	TP_STRUCT__entry(
-		__field(unsigned int, frame_num)
-	),
-	TP_fast_assign(
-		__entry->frame_num = frame_num;
-	),
-	TP_printk("REF L0: DPB: Frame 0: frame_num = %u", __entry->frame_num)
+	    TP_PROTO(unsigned int frame_num),
+	    TP_ARGS(frame_num),
+	    TP_STRUCT__entry(__field(unsigned int, frame_num)),
+	    TP_fast_assign(__entry->frame_num = frame_num;),
+	    TP_printk("REF L0: DPB: Frame 0: frame_num = %u", __entry->frame_num)
 );
 
 TRACE_EVENT(vde_ref_l1,
-	TP_PROTO(unsigned int with_later_poc_nb,
-		 unsigned int with_earlier_poc_nb),
-	TP_ARGS(with_later_poc_nb, with_earlier_poc_nb),
-	TP_STRUCT__entry(
-		__field(unsigned int, with_later_poc_nb)
-		__field(unsigned int, with_earlier_poc_nb)
-	),
-	TP_fast_assign(
-		__entry->with_later_poc_nb = with_later_poc_nb;
-		__entry->with_earlier_poc_nb = with_earlier_poc_nb;
-	),
-	TP_printk("REF L1: with_later_poc_nb %u, with_earlier_poc_nb %u",
-		  __entry->with_later_poc_nb, __entry->with_earlier_poc_nb)
+	    TP_PROTO(unsigned int with_later_poc_nb,
+		     unsigned int with_earlier_poc_nb),
+	    TP_ARGS(with_later_poc_nb, with_earlier_poc_nb),
+		    TP_STRUCT__entry(__field(unsigned int, with_later_poc_nb)
+				     __field(unsigned int, with_earlier_poc_nb)),
+		    TP_fast_assign(__entry->with_later_poc_nb = with_later_poc_nb;
+				   __entry->with_earlier_poc_nb = with_earlier_poc_nb;),
+		    TP_printk("REF L1: with_later_poc_nb %u, with_earlier_poc_nb %u",
+			      __entry->with_later_poc_nb, __entry->with_earlier_poc_nb)
 );
 
 #endif /* TEGRA_VDE_TRACE_H */
-- 
2.7.4

