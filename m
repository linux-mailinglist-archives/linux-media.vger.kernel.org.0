Return-Path: <linux-media+bounces-34065-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D282CACDF8A
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 15:47:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D0C107A3357
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 13:46:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B383C28F922;
	Wed,  4 Jun 2025 13:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="iSPx61pu"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2FE4C7C;
	Wed,  4 Jun 2025 13:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749044861; cv=none; b=hA4bOztoyzESmbINId5Xlm8Y0dV/rdR1lp8+Db+LHtPbOtwUFbv/wKcN6ZvE7Yu6y80yLdUCotIfTC41CZW4nWtTZ2pHJiP+9Al6mgWoDDRW568pyCcTTqKC+yQ3eUY1KCD+KEoje4zFlx6XrK//H+1kEM+O1AEXtL+IvCspu88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749044861; c=relaxed/simple;
	bh=qAWE4ZHvfBr8J312bFyemArwB1AHHgZ8BFzkRR7+v30=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=n0Mg/0FfX0g3wUVXjVIGdlD8E0WRgy5NM0SJ6r2Vo7u/ETmHPJjH7ynPhMaTAOnxqTTtm7ZoocYnoeYqlJGiHjZ6RfrdIJo2L2a+VXVK/Ea0myjzST5n+9MXbXhd25T14Sbu563I0AQdKMrbpx7Hre4xMADK892qOnLfZXCeGFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=iSPx61pu; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749044857;
	bh=qAWE4ZHvfBr8J312bFyemArwB1AHHgZ8BFzkRR7+v30=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=iSPx61pu5tgpGOmLaiVA37WIJDdHSlCglJ/lyW3CP9UNjbR6gLyO6gDnwVBFTg9q0
	 W8TCw3zcHNG8Zomc6hu3akBb6JEJuQ62UM1nGuhbTDnmoVHxiio1DDHLFlNbC7BwHM
	 swjYb17yxteN65Hic0TDuduoSxY1F2ICw6wyOMg3oEUIJWkC8LEZfXoVKuAc9PSvaa
	 zevhXDccaHcaFGkclWjrqjL4R3thck4We+IJGC9QSDl2cYFU+NzYDjTCjl3DFnvd9U
	 Ren8K2RGYeCnG9Ivp/U1roEPdIgtOkcVAUBGOh1nNHtGpZokgbIQx0Vvakkj1DVIII
	 GKmzy+OwFR45Q==
Received: from [IPv6:2606:6d00:10:5285::5ac] (unknown [IPv6:2606:6d00:10:5285::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 18B2D17E0C87;
	Wed,  4 Jun 2025 15:47:35 +0200 (CEST)
Message-ID: <1318bd68f2d60b9d44cb22bd90b92399311f0b00.camel@collabora.com>
Subject: Re: [PATCH v2 2/7] media: chips-media: wave5: Improve performance
 of decoder
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: "jackson.lee" <jackson.lee@chipsnmedia.com>, "mchehab@kernel.org"	
 <mchehab@kernel.org>, "hverkuil-cisco@xs4all.nl"
 <hverkuil-cisco@xs4all.nl>,  "bob.beckett@collabora.com"	
 <bob.beckett@collabora.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org"	 <linux-kernel@vger.kernel.org>,
 "lafley.kim" <lafley.kim@chipsnmedia.com>,  "b-brnich@ti.com"	
 <b-brnich@ti.com>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, Nas Chung	
 <nas.chung@chipsnmedia.com>
Date: Wed, 04 Jun 2025 09:47:34 -0400
In-Reply-To: <SE1P216MB13033207BDFE2A6BCC48999EED6CA@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
References: <20250522072606.51-1-jackson.lee@chipsnmedia.com>
			 <20250522072606.51-3-jackson.lee@chipsnmedia.com>
		 <3afbd0253fabcf9f8795ab2231107e2e9da012cc.camel@collabora.com>
		 <SE1P216MB1303C1D1C2A9FA165A01B71AED64A@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
	 <03a87e1c9e8f77887c2457b9c3fcbf0c6a6cf287.camel@collabora.com>
	 <SE1P216MB13033207BDFE2A6BCC48999EED6CA@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
Organization: Collabora Canada
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Le mercredi 04 juin 2025 à 04:09 +0000, jackson.lee a écrit :
> > Running in loop anything is never the right approach. The device_run()
> > should be run when a useful event occur and filtered by the job_ready()
> > ops. I believe I'm proposing some hint how to solve this design issue. The
> > issue is quite clear with the follow up patch trying to reduce the CPU
> > usage due to spinning.
> 
> 
> 
> Thanks for your feedback.
> But there is one thing to say to you.
> After receiving EOS from application, we have to periodically run the device_run
> to send the DEC_PIC command so that VPU can trigger interrupt  until getting all 
> decoded frames and EOS from Get_Result command.
> So even if we sent EOS to VPU once, we should run the device_run function continuously,
> the above code was added. If the job_ready returns false to prevent running the
> device_run after sending EOS to VPU, then GStreamer pipeline will not be terminated 
> normally because of not receiving all decoded frames.

This, in my opinion, boils down to a small flaw, either in the firmware or the driver.
This is why there was this code:

-
-	/*
-	 * During a resolution change and while draining, the firmware may flush
-	 * the reorder queue regardless of having a matching decoding operation
-	 * pending. Only terminate the job if there are no more IRQ coming.
-	 */
-	wave5_vpu_dec_give_command(inst, DEC_GET_QUEUE_STATUS, &q_status);
-	if (q_status.report_queue_count == 0 &&
-	    (q_status.instance_queue_count == 0 || dec_info.sequence_changed)) {
-		dev_dbg(inst->dev->dev, "%s: finishing job.\n", __func__);
-		pm_runtime_mark_last_busy(inst->dev->dev);
-		pm_runtime_put_autosuspend(inst->dev->dev);
-		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
-	}

Which you removed in this patch, as it makes it impossible to utilise the HW queues.
In the specific case you described, if my memory is right, the CMD_STOP (EOS in your
terms) comes in race with the queue being consumed, leading to possibly having no
event to figure-out when we are done with that sequenece.

V4L2 M2M is all event based, and v4l2_m2m_job_finish() is one of those. But in the
new implementation, this event no longer correlate with the HW being idle.
This is fine, don't read me wrong. It now matches the driver being ready to try and
queue more work.

So my question is, is there a way to know, at CMD_STOP call, that the HW
has gone idle, and that no more events will allow handling the EOS case?

Nicolas

