Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 384F33459ED
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 09:39:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229448AbhCWIj0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 04:39:26 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:36771 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229665AbhCWIjV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 04:39:21 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id OcZIlupP7UzyrOcZMlOmx9; Tue, 23 Mar 2021 09:39:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616488760; bh=9zwPOhejpKrd4MXuoLABE6y2aVBsirx68OLpXBzRhqU=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=pL8s0XouB3BGZqEftyWSmSssJRDGImOWviDCygwhI0XZKzgxAGlPrfyV6rSgQA2QH
         hAusc1TQL2/Se/mNfnyPg7XwWEh0UZNuzELQpbNyaKnoefwyuPGr4ekQFk8IwJ7MGQ
         +E9gyXO5hdIdXatkIQs9utwRYJzvTNSc7Y3IoJSeQ0EtOYTjycLNyhWewkdPkK6Zsh
         vP2ftpvX4Uu3cf03AjFN429l77FYIC61L08FkurRtPbYo99jS706sTX8X95R5zwZKD
         odFtz6Wgt5aZ8V1+3mGLDbc6e2mGsc4AH9FtfjPYR+uyACnoBtvTsnhUh6MAVbEybU
         8Yed/DpGJ/zOw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] s5p-jpeg/jpeg-core.h: fix kernel-doc warnings
Message-ID: <5973dfa5-9c4d-8ab5-dcb7-6ccdf4863403@xs4all.nl>
Date:   Tue, 23 Mar 2021 09:39:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfFzYE0R8rqqgp7csCAY1vpBtAfAL6lfshnUMLh0KdLTVuC55rL8lCM5OlKlk6NxD5mAlwDnlvnKBcoUAKEH7shZMDYXO4Sw1SMTXHJSqUUR5gP7WLqS1
 T8O0QMkP9wolET24Nanq3Y2HCbfdXXLfptk8UoW3cktKKb6KMeH8sqkFpdr1M/SHDeQsUZLezacankThLCr+0AoaoqI2Kt37GJHMgghWVKUKmxB0938aGU6r
 10riT5i3/DaElsdNSm2r0rWcdWAp4AxB9Ubj8ccHQ69j35aPLxpnVYb+uTgq/P4x
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes these warnings:

drivers/media/platform/s5p-jpeg/jpeg-core.h:136: warning: Function parameter or member 'irq_ret' not described in 's5p_jpeg'
drivers/media/platform/s5p-jpeg/jpeg-core.h:136: warning: Function parameter or member 'irq_status' not described in 's5p_jpeg'
drivers/media/platform/s5p-jpeg/jpeg-core.h:168: warning: Function parameter or member 'memplanes' not described in 's5p_jpeg_fmt'
drivers/media/platform/s5p-jpeg/jpeg-core.h:168: warning: Function parameter or member 'subsampling' not described in 's5p_jpeg_fmt'

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/platform/s5p-jpeg/jpeg-core.h b/drivers/media/platform/s5p-jpeg/jpeg-core.h
index fcd21ae8bcbe..a77d93c098ce 100644
--- a/drivers/media/platform/s5p-jpeg/jpeg-core.h
+++ b/drivers/media/platform/s5p-jpeg/jpeg-core.h
@@ -111,10 +111,11 @@ enum s5p_jpeg_ctx_state {
  * @m2m_dev:		v4l2 mem2mem device data
  * @regs:		JPEG IP registers mapping
  * @irq:		JPEG IP irq
+ * @irq_ret:		JPEG IP irq result value
  * @clocks:		JPEG IP clock(s)
  * @dev:		JPEG IP struct device
  * @variant:		driver variant to be used
- * @irq_status		interrupt flags set during single encode/decode
+ * @irq_status:		interrupt flags set during single encode/decode
  *			operation
  */
 struct s5p_jpeg {
@@ -152,8 +153,10 @@ struct s5p_jpeg_variant {
  * @fourcc:	the fourcc code, 0 if not applicable
  * @depth:	number of bits per pixel
  * @colplanes:	number of color planes (1 for packed formats)
+ * @memplanes:	number of memory planes (1 for packed formats)
  * @h_align:	horizontal alignment order (align to 2^h_align)
  * @v_align:	vertical alignment order (align to 2^v_align)
+ * @subsampling:subsampling of a raw format or a JPEG
  * @flags:	flags describing format applicability
  */
 struct s5p_jpeg_fmt {
