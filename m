Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BF7CA2B91
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2019 02:43:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727392AbfH3An1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Aug 2019 20:43:27 -0400
Received: from mx1.ucr.edu ([138.23.248.2]:2027 "EHLO mx1.ucr.edu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726384AbfH3An1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Aug 2019 20:43:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1567125835; x=1598661835;
  h=from:to:cc:subject:date:message-id;
  bh=x/hPFWrb7N7daafIx/1mPp6kx5SsK9IpY+Su725vKIk=;
  b=EV4KjYvlr6Y5+eKvq/zmeGq60famIP4jRhwtP/fqjLV6Y551IbrGLdjB
   tDM468qXFZpz4j7Fcx+1e9TkwpmxNMk8FEjVq0WARFDgkrsojPI+giT+7
   sPq/pZ4/9+bpgwd8OeSFa+5kcVyTRwjeTWSZylWNYaeK9jkT7ovNWtpu7
   NQh0ocJlFhj0iYUzMBHgcxKIFS/9D3U1W5fRwdIvNQ02++OK0itiKKXsM
   +DQW1tlB9Dpv+kBLljOrn2gfqp08CkTATh3AIGgeLQ7e3RTnITjPJIE32
   TPe7BqkQr9yaznY4Nrf9Es5zzgB8uCxa+dFc5BJxSVMulx1rZ5//ZAIJ5
   Q==;
IronPort-SDR: WiYfg2/pV52YCmrXmlDmOfgTq3KJJuygJeEhBWLdUAQITSK0UKmQLwfLkKKPAURPYDlQPqxYUl
 FD6JxtNN3Cba6OLtG7lDFJZaxpm45ZdnsHxLdfe8zkHztODLfnBatRl0CxZeZvZydK2CU7te4S
 3Rx2ZjnhD1vxxCpq/ZPDx1L+U3j0QkASscjgjZYRHoz5oZwEE7gqtfcEHnF73HeAnU7V0NPS9O
 cenpSJYLleIkkWY6/mcPQC4fRpsqLbuOqn5yHEiNAM2Rvbtv94tUechpAcrNgpf+ZyzNRvnowz
 b1U=
IronPort-PHdr: =?us-ascii?q?9a23=3Ar0JgpxXnz7Uur4rTZZ0WyM7/OmXV8LGtZVwlr6?=
 =?us-ascii?q?E/grcLSJyIuqrYYx2Ft8tkgFKBZ4jH8fUM07OQ7/m6HzVeut3a7DgrS99lb1?=
 =?us-ascii?q?c9k8IYnggtUoauKHbQC7rUVRE8B9lIT1R//nu2YgB/Ecf6YEDO8DXptWZBUh?=
 =?us-ascii?q?rwOhBoKevrB4Xck9q41/yo+53Ufg5EmCexbal9IRmrswndrNQajIpsJ6o+xB?=
 =?us-ascii?q?bErWZDdvhLy29vOV+dhQv36N2q/J5k/SRQuvYh+NBFXK7nYak2TqFWASo/PW?=
 =?us-ascii?q?wt68LlqRfMTQ2U5nsBSWoWiQZHAxLE7B7hQJj8tDbxu/dn1ymbOc32Sq00WS?=
 =?us-ascii?q?in4qx2RhLklDsLOjgk+2zMlMd+kLxUrw6gpxxnwo7bfoeVNOZlfqjAed8WXH?=
 =?us-ascii?q?dNUtpNWyBEBI68aooPD/EaPeZZqYn9qEYFowWnCwKxCuPvyyFHhnvr0qYn1+?=
 =?us-ascii?q?gsHx3K0AkmEtkTsnrbsc/1Ob8SX+6r0afGwzbNYfRN1Dvh9ITFaAwtrOuQUb?=
 =?us-ascii?q?5sd8fa1EkhFxnCjlWVsYHqPTKV1+UNs2iG6OprSOWiim4mqgFxuDevx9sghp?=
 =?us-ascii?q?XHi48O11DL6T95zJwrKtKlVU52eNipG4ZTuSGCL4Z6XN8uTmVytCs5yrAKo4?=
 =?us-ascii?q?C3cDUFxZg92RLTd+CLf5CV7h/iUOudOyl0iXxldb6lmRq/8FKsx+/zW8SyzV?=
 =?us-ascii?q?1EtDBKksPWuXAIzxHT78+HReZj8Uq5wjaP0hzT6vlDIUApiarXM54hzaA0lp?=
 =?us-ascii?q?oUqUnDGzX5mETyjKOPbkUk/vWk5/3pYrn4upOQK5V4ig75MqQplcy/Bfo3Ph?=
 =?us-ascii?q?ISUGic/OSwzLzj/UvnT7VWlvA6jLXVvZTAKckYpqO1GRFZ3pss5hqlETuqzM?=
 =?us-ascii?q?gUkWECLF1feRKHi4bpO0vJIPD9Ffq+g1WtkDdxyPDHIrHtHpvAI2PekLj9Z7?=
 =?us-ascii?q?Zx8VBTxxcuzdxH/ZJbFqkBIO7vWk/2rNHYCh45Mwqpw+foEdl9050RVn+OAq?=
 =?us-ascii?q?CDK67Sr1CI6fw1I+WWZ48apiz9K/476P7ql3M5nkUdfab6lbUNb3XtL/V0I1?=
 =?us-ascii?q?ieKS79kNcIED9S5SIjR/ashVGfB20AL02uVr4xs2loQLmtCp3OE8Xy2LE=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2GUBACqgmddgMjWVdFlHgEGBwaBZ4N?=
 =?us-ascii?q?YTBCNHYZcAQEBBosfGHGFeYMJhx8BCAEBAQwBAS0CAQGEP4JbIzgTAgMIAQE?=
 =?us-ascii?q?FAQEBAQEGBAEBAhABAQkNCQgnhUOCOimCYAsWFVJWPwEFATUiOYJHAYF2FJ0?=
 =?us-ascii?q?8gQM8jCMziGkBCAyBSQkBCIEihx6EWYEQgQeDdWyEDYNWgkQEgS4BAQGUTpY?=
 =?us-ascii?q?FAQYCAYIMFIFyklMnhDCJGYsTAS2EB6FwAgoHBg8hgUaBek0lgWwKgUSCeo4?=
 =?us-ascii?q?tHzOBCIwBglQB?=
X-IPAS-Result: =?us-ascii?q?A2GUBACqgmddgMjWVdFlHgEGBwaBZ4NYTBCNHYZcAQEBB?=
 =?us-ascii?q?osfGHGFeYMJhx8BCAEBAQwBAS0CAQGEP4JbIzgTAgMIAQEFAQEBAQEGBAEBA?=
 =?us-ascii?q?hABAQkNCQgnhUOCOimCYAsWFVJWPwEFATUiOYJHAYF2FJ08gQM8jCMziGkBC?=
 =?us-ascii?q?AyBSQkBCIEihx6EWYEQgQeDdWyEDYNWgkQEgS4BAQGUTpYFAQYCAYIMFIFyk?=
 =?us-ascii?q?lMnhDCJGYsTAS2EB6FwAgoHBg8hgUaBek0lgWwKgUSCeo4tHzOBCIwBglQB?=
X-IronPort-AV: E=Sophos;i="5.64,443,1559545200"; 
   d="scan'208";a="4935558"
Received: from mail-pl1-f200.google.com ([209.85.214.200])
  by smtp1.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2019 17:43:54 -0700
Received: by mail-pl1-f200.google.com with SMTP id k9so3022409pls.13
        for <linux-media@vger.kernel.org>; Thu, 29 Aug 2019 17:43:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=pUmojDYDL1a61kg6eynxQw3TTop/vKblfuVM8e3GTao=;
        b=ip/VNluYcqn3xYGP7fDzkq0+0wi4w274ZnxuaF4JOTOGAhSV76dgMf2217vcc+E66G
         qn1/wqblXzzdudN4E8lPyLzzjL6UcsBmEGKBE2U0vxzwXn8GVnZrw6w8jJX+vY0+ryju
         oOkvWS+W3riCvWUPx1id8VS6ia0xE56NgoS3zlXpPjyOzpNod1C5+so7+fINX3t2/Hdr
         CxnRJHbzQKgRp83V8R4yUI3Dg/x2J5rmbt1S+8LOK8S8iAXH5lYpWoUiPdDPJXYnZ4Er
         Df05TXJx+ClLQdjr3LGzcv2JVXrt2bA0o2L67W82SGCpvtMdth0wDBgIFX758Uf/wquc
         QMQQ==
X-Gm-Message-State: APjAAAWOfYBK1vKGwHxCrdcGjDuLxGANhVmuUz9CTm8rqUl7BmqP1D7D
        gzG03i8UOZoA4f5L5SU6bua1Z0Q2KDZCGDPxNhB1Dp2aeMUaf/0twcqlr14bsFgiH+0GLdJSfo4
        VtUuQeYqhkqV9feozUfovw+Wz
X-Received: by 2002:a17:902:4581:: with SMTP id n1mr13190813pld.310.1567125806238;
        Thu, 29 Aug 2019 17:43:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwc6/cUWPfDkfqfrO57m1Cx+08ZFPT0rsri0ogDcuq7WHFidY41roOHBxcCTPRfJirehBoShA==
X-Received: by 2002:a17:902:4581:: with SMTP id n1mr13190790pld.310.1567125806046;
        Thu, 29 Aug 2019 17:43:26 -0700 (PDT)
Received: from Yizhuo.cs.ucr.edu (yizhuo.cs.ucr.edu. [169.235.26.74])
        by smtp.googlemail.com with ESMTPSA id g26sm4151989pfi.103.2019.08.29.17.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 17:43:25 -0700 (PDT)
From:   Yizhuo <yzhai003@ucr.edu>
Cc:     csong@cs.ucr.edu, zhiyunq@cs.ucr.edu, Yizhuo <yzhai003@ucr.edu>,
        Andy Walls <awalls@md.metrocast.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] [media] drivers/media/pci: Variable vbi.type could be uninitialized if macro v4l2_subdev_call set __result an error code
Date:   Thu, 29 Aug 2019 17:43:59 -0700
Message-Id: <20190830004359.22622-1-yzhai003@ucr.edu>
X-Mailer: git-send-email 2.17.1
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Inside function compress_sliced_buf(), variable vbi.type is
uninitialized if macro v4l2_subdev_call set __result an
error code. However, vbi.type is used in the if statement
without any check, which is potentially unsafe.

Signed-off-by: Yizhuo <yzhai003@ucr.edu>
---
 drivers/media/pci/ivtv/ivtv-vbi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/ivtv/ivtv-vbi.c b/drivers/media/pci/ivtv/ivtv-vbi.c
index 3c156bc70fb4..e8140cab8c45 100644
--- a/drivers/media/pci/ivtv/ivtv-vbi.c
+++ b/drivers/media/pci/ivtv/ivtv-vbi.c
@@ -337,7 +337,7 @@ static u32 compress_raw_buf(struct ivtv *itv, u8 *buf, u32 size)
 static u32 compress_sliced_buf(struct ivtv *itv, u32 line, u8 *buf, u32 size, u8 sav)
 {
 	u32 line_size = itv->vbi.sliced_decoder_line_size;
-	struct v4l2_decode_vbi_line vbi;
+	struct v4l2_decode_vbi_line vbi = {};
 	int i;
 	unsigned lines = 0;
 
-- 
2.17.1

