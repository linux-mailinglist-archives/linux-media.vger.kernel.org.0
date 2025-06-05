Return-Path: <linux-media+bounces-34134-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A9CACF098
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 15:31:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B4EB97A8C90
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 13:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A4C4235044;
	Thu,  5 Jun 2025 13:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="LfdM+OvS"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B46022DFA8;
	Thu,  5 Jun 2025 13:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749130124; cv=none; b=KhixSwks5QbAvNUtiLguF4tu/5pXNqsTNW4525YMOgkn8yf3IYfu5bmIOXsv1j0KzDj473OdNm2R7Bh9ktb4RJ3IU1+JEWnXdtAOSwQPhHGry/bQ6Jwd0J3X6dSAzNt2SikDdOPgwpt58ydXO+0sjuvRP7GjaFIsplOD7XXYn00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749130124; c=relaxed/simple;
	bh=7c0kVEdp8oXjCBNdnSD4JFmSoMj9ju4oSLGkVs5cnXI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OQSCoYMAg2aH1u5aT6KC5GtUskAM/hZz7myog1C3cZkRCfSgDmBEfQ4bldRZWaJm5IXmzGSYQrJVTkK9mpbkO6vNV6CDyiVFKQTx1ePoUu9JXASDfpdDjAnIe+TYfiO4aQQJQew5cCnVpwMfwnj3uQNDSlmlnKfQ/389FC5L0Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=LfdM+OvS; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749130120;
	bh=7c0kVEdp8oXjCBNdnSD4JFmSoMj9ju4oSLGkVs5cnXI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=LfdM+OvScQCSkNKKnZKcHfNiNCjK54Go6om0chdCnknHigNqHG0lsWJtczbsubvBf
	 Tv//5TCxf4puIbszBwynwP+YyF/b28w/3vAD1oDIz+8ew25lu+ul2YetTi8BUu7+/s
	 9k9WcjI5s+SD8aodLOuzNGk1YerbcZQKYRhtbWJdSMob5aPW7XdiDBPQia2W2WwkKJ
	 1dDC+mNCmqBWQr/WL/G3dsH1H1PnXKzuu2THGLUC7rgCTn/ffXRx+SHlXY7mtQjsnK
	 7DCzPjpsPxviJ9bJHjMuxPZm0BLMXkAWUR0nnkBewl+mKlG3dfMddTpbiqYjueeQUt
	 /0y6XonOlE5RA==
Received: from [IPv6:2606:6d00:10:5285::5ac] (unknown [IPv6:2606:6d00:10:5285::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4405B17E088C;
	Thu,  5 Jun 2025 15:28:39 +0200 (CEST)
Message-ID: <8c6316d2d00287e96bc2ad5d27c8de37f990b7e5.camel@collabora.com>
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
Date: Thu, 05 Jun 2025 09:28:37 -0400
In-Reply-To: <SE1P216MB1303F7ADAC83F6CE312C5CA3ED6FA@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
References: <20250522072606.51-1-jackson.lee@chipsnmedia.com>
				 <20250522072606.51-3-jackson.lee@chipsnmedia.com>
			 <3afbd0253fabcf9f8795ab2231107e2e9da012cc.camel@collabora.com>
			 <SE1P216MB1303C1D1C2A9FA165A01B71AED64A@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
		 <03a87e1c9e8f77887c2457b9c3fcbf0c6a6cf287.camel@collabora.com>
		 <SE1P216MB13033207BDFE2A6BCC48999EED6CA@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
	 <1318bd68f2d60b9d44cb22bd90b92399311f0b00.camel@collabora.com>
	 <SE1P216MB1303F7ADAC83F6CE312C5CA3ED6FA@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
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

Hi,

Le jeudi 05 juin 2025 à 04:50 +0000, jackson.lee a écrit :
> > So my question is, is there a way to know, at CMD_STOP call, that the HW
> > has gone idle, and that no more events will allow handling the EOS case?
> > 
> > Nicolas
> 
> 
> Thanks for your reply.	
> 
> Now there is only one thing to know if there is more events or not to handle the EOS case.
> It is that driver sends DEC_PIC command to VPU continuously until display index is -2(it means EOS) from VPU.
> VPU should trigger interrupts to get display index from the finish_decode function.
> So we have to run device_run to send DEC_PIC command.

What don't want to see is a loop where we do:

	device_run()
		finish_job()
			device_run()
				finish_job()
					....

What I see now, is that we simply bang on the trigger until it completes, which
is very wasteful in power and CPU time. In your next version, make sure to
find a mitigation to that active loop, and document it please.

Nicolas

