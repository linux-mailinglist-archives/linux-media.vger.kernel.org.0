Return-Path: <linux-media+bounces-26838-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D96A422E2
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 15:24:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8AF481703A5
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 14:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4016E1624FC;
	Mon, 24 Feb 2025 14:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="ZmFz/uEh"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9D92AD14;
	Mon, 24 Feb 2025 14:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740406672; cv=pass; b=lxwaP5DFnoSy9CZ+ak4AWenF/Ar1H2CBreC717V5OP2FW7XKvGtk7kHaqt2kiBpV8hTgNIfslF61pkBTqvlYvVNeQOXFeWQvBEcTfgFeLcPr4XRcPdUkAUvdgasf1L3lDkmCVa3Za+gIu56iqUMNJGW0FV9KiLENrTkTYtIy0NI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740406672; c=relaxed/simple;
	bh=XI++tVurN1XBa9ntDF4BUg/9Zw6NAVZ//VSvMvNTb3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YlA1SCxvW7YtuClFuZogFBwewVUUEUfL06epe1uLycR2/pu3fiYHd8i3bfo1oZafjn6y+RGXuE26ZtmpT0aid86lHWGN/JsS20CySJtj2CsDn78SeegTWF0sE3MWcvzAJRXdiZE/uMFIAYb2ucFSil59jUsi1R7bJpz2K/KN5uE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=ZmFz/uEh; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1740406643; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jh4G+fge5VpcjAQvBdSnRAzNFmDfBuNbnwANkTlPuMo4R32/1T5hKa5IFixFAXUtxBaITENB/2oVbSbzmXC5sU4qoOmLFi++ReaOhpn2XjVrwOOK0CwlTV4ZNJOdndnrOflbm9y5zo6GPNdBJtT3miYK42lSUkcUQ1ADdDRKWf8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740406643; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8y7RULCgtA+twMB2yoTCUBB2R8TtZLUOKexPHO9EEnY=; 
	b=UM59J+AyUZGyT5ZELv/DWFRQl6CzSlHRC433YB5pMxBv7mHp8AhcCfjNwFaoLtqjstSEQjfj08bjw5iAHb7LQuilMZPt58xJfJ0DgREAqCERZW16dURYG5hALvUFPM4VvwZXfpgRKzrZxM7jcoFtykbimhY/QA5dMwoenaF6SEk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740406643;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=8y7RULCgtA+twMB2yoTCUBB2R8TtZLUOKexPHO9EEnY=;
	b=ZmFz/uEhN425WoWrs4s1sezOV6J9789a3rllYJQU+DFg/XxZcrotZsP9G4pyx3HD
	e4YKJT08UbPcbCPDBBIzj60wK2wH7KVP2u3UJbk93cJnXIf3MmFQrcFoMDk383jYLU8
	BE/CaejoUqQQZ+TsgotKmNRWAzHlCRuIrHOwixl4=
Received: by mx.zohomail.com with SMTPS id 1740406641336970.3444548054779;
	Mon, 24 Feb 2025 06:17:21 -0800 (PST)
Date: Mon, 24 Feb 2025 15:17:12 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Ming Qian <ming.qian@oss.nxp.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, nicolas@ndufresne.ca,
	shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
	xiahong.bao@nxp.com, eagle.zhou@nxp.com, tao.jiang_2@nxp.com,
	imx@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] media: amphion: Add a frame flush mode for decoder
Message-ID: <20250224141712.soexl43hrimwf236@basti-XPS-13-9310>
References: <20250117075720.4018076-1-ming.qian@oss.nxp.com>
 <20250117075720.4018076-2-ming.qian@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20250117075720.4018076-2-ming.qian@oss.nxp.com>
X-ZohoMailClient: External

Hey Ming,

On 17.01.2025 16:57, Ming Qian wrote:
>The amphion decoder will pre-parse 3 frames before decoding the first
>frame. If we append a flush padding data after frame, the decoder
>will finish parsing and start to decode when the flush data is parsed.
>It can reduce the decoding latency.
>In the past, we only enable this mode when the display delay is set to
>0. But we still can enable this mode without changing the display order,
>so we add a frame_flush_mode parameter to enable it.

My recommendation:

By default the amphion decoder will pre-parse 3 frames before starting
to decode the first frame. Alternatively, a block of flush padding data
can be appended to the frame, which will ensure that the decoder can
start decoding immediately after parsing the flush padding data, thus
potentially reducing decoding latency.
This mode was previously only enabled, when the display delay was set to
0. Allow the user to manually toggle the use of that mode via a module
parameter called frame_flush_mode, which enables the mode without
changing the display order.


Which fixes a few grammatical issues and tries to be a bit more clear.
But please confirm to me that I hit your intended meaning.

More comments below ...

>
>Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>---
> drivers/media/platform/amphion/vpu_malone.c | 5 ++++-
> 1 file changed, 4 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/media/platform/amphion/vpu_malone.c b/drivers/media/platform/amphion/vpu_malone.c
>index 1d9e10d9bec1..f07660dc3b07 100644
>--- a/drivers/media/platform/amphion/vpu_malone.c
>+++ b/drivers/media/platform/amphion/vpu_malone.c
>@@ -25,6 +25,9 @@
> #include "vpu_imx8q.h"
> #include "vpu_malone.h"
>
>+static bool frame_flush_mode;
>+module_param(frame_flush_mode, bool, 0644);

Could you add a comment here that makes clear to the reader briefly what
the expected behavior of frame_flush_mode = 0 and frame_flush_mode = 1
is?

>+
> #define CMD_SIZE			25600
> #define MSG_SIZE			25600
> #define CODEC_SIZE			0x1000
>@@ -1579,7 +1582,7 @@ static int vpu_malone_input_frame_data(struct vpu_malone_str_buffer __iomem *str
>
> 	vpu_malone_update_wptr(str_buf, wptr);
>
>-	if (disp_imm && !vpu_vb_is_codecconfig(vbuf)) {
>+	if ((disp_imm || frame_flush_mode) && !vpu_vb_is_codecconfig(vbuf)) {

So you say that the mode was enabled with display delay set to 0,
meaning (disp_imm = 1) == (display delay = 0), right? E.g. disp_imm
means display_immediately I guess.

I think this all deserves a lot better documentation, otherwise the code
becomes quite cryptic. Could you add a comment before this line, which
explains the entry conditions disp_imm & frame_flush_mode and the
codeconfig thing and that explains briefly what kind of mode we are
entering here?

> 		ret = vpu_malone_add_scode(inst->core->iface,
> 					   inst->id,
> 					   &inst->stream_buffer,
>-- 
>2.43.0-rc1
>
>

Regards,
Sebastian Fricke

