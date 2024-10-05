Return-Path: <linux-media+bounces-19128-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3771991741
	for <lists+linux-media@lfdr.de>; Sat,  5 Oct 2024 16:16:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41CCA283787
	for <lists+linux-media@lfdr.de>; Sat,  5 Oct 2024 14:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 042A314C5B3;
	Sat,  5 Oct 2024 14:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b="FHlK55fB"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E0D4C91
	for <linux-media@vger.kernel.org>; Sat,  5 Oct 2024 14:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728137755; cv=pass; b=GFGhFMg90t+qBv8nDJULiWvwHioLV1Xh7rGin2tJvdql0axF15Y+JXuWfjZ9si8Wdy3OELaLRFxOU6g8tavNGp+jEgCXL3V+Uk9CP/5R4IpNDwouBt2VNglhgpfYaE8Gb2fgekY/8++rHF6TGrJGApjsctqzxpHIHE0Wqy3jY2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728137755; c=relaxed/simple;
	bh=mHbM+mUp+YWTFV5sQM+Vl5FBCHAS0y9P2+8g5OiwOa0=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=UUESivWqylcOcICStxCfyIA2G+4E22Zm+Y08oBTYcrva3is4DocKGJ0pvX6mFH4LC8NqOLZKkhBwbprd8tF25DnjERbcMyYJfxBwS8uOz/e4hmNRzmUCRS4CFSDaIRhdWT88hvCfcxDFkVzihnoNjZ3g2TJmAIWIkQaPKKJ3/wA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b=FHlK55fB; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1728137717; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Aw0VVgvcD2F+94zUjo6pc7HPWBgv53Bxvi3uMJUjDo+KfDkd+Cx2THFqvGyEr9Rph6VUGTFbtCWzfpk8jnEL3NRPZo2IXVL/zD+fN6N1G/mHneZBjKBlGMO9Nq7Tqn8ru11bvqxeeHe7owGg6fHTEWTZmIOJ7O6a9Pnz+me4MV0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728137717; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7H3IQzgccMsNg5tQzZHUe4gV7spyI8nvdr4vDcWL4k4=; 
	b=OXS53tBOFhXJ2+8mdREOnZrjgjFQ/EqfxD/EjBXJ2NCiPmBj1o+eETsDVXDeTDHCLZ/nQwvMTrHHU7LwBmC1q74M8vzJaM+QFPRZLFlLuXaV6kD4au0ddGubxoSFo1cHYAD3EWELCcAI719UCGRG9mp+HyWHWHOR3qZ3sdOKW/g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=gus@collabora.com;
	dmarc=pass header.from=<gus@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728137717;
	s=zohomail; d=collabora.com; i=gus@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=7H3IQzgccMsNg5tQzZHUe4gV7spyI8nvdr4vDcWL4k4=;
	b=FHlK55fBaqSsKXiakCRIqrlA0sP14rMSXFlLKqlnpN3nxJ5VGT5zqWgf36RDIf6a
	AejcfGhB3amhKhZOCUCimm53ypps5bCdAoz+giAM1bAwIoe6lBd6vlMKh6tnxViXjM7
	8sRuM5V8uLOpe8QTccaKiqHalZL/XyFczZ4vrJww=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1728137716561624.9577962701924; Sat, 5 Oct 2024 07:15:16 -0700 (PDT)
Date: Sat, 05 Oct 2024 11:15:16 -0300
From: Gustavo Padovan <gus@collabora.com>
To: "Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>
Cc: "Hecht,  Martin" <Martin.Hecht@avnet.eu>,
	"Sebastian Fricke" <sebastian.fricke@collabora.com>,
	"Hans Verkuil" <hverkuil@xs4all.nl>,
	"Linux Media Mailing List" <linux-media@vger.kernel.org>,
	"Sakari Ailus" <sakari.ailus@linux.intel.com>,
	"Daniel Almeida" <daniel.almeida@collabora.com>,
	"Mauro Carvalho Chehab" <mchehab@kernel.org>,
	"Tommaso Merciai" <tomm.merciai@gmail.com>,
	"Jacopo Mondi" <jacopo.mondi@ideasonboard.com>,
	"Benjamin Mugnier" <benjamin.mugnier@foss.st.com>,
	"Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
	"Ricardo Ribalda" <ribalda@chromium.org>,
	"Michael Tretter" <m.tretter@pengutronix.de>,
	"Alain Volmat" <alain.volmat@foss.st.com>,
	"Sean Young" <sean@mess.org>, "Steve Cho" <stevecho@chromium.org>,
	"Tomasz Figa" <tfiga@chromium.org>,
	"Hidenori Kobayashi" <hidenorik@chromium.org>,
	"Hu,  Jerry W" <jerry.w.hu@intel.com>,
	"Suresh Vankadara" <svankada@qti.qualcomm.com>,
	"Devarsh Thakkar" <devarsht@ti.com>,
	"r-donadkar@ti.com" <r-donadkar@ti.com>,
	"Dave Stevenson" <dave.stevenson@raspberrypi.com>,
	"Mehdi Djait" <mehdi.djait@linux.intel.com>,
	"Nicolas Dufresne" <nicolas@ndufresne.ca>,
	"Salahaldeen Altous" <salahaldeen.altous@leica-camera.com>,
	"kernelci" <kernelci@lists.linux.dev>
Message-ID: <1925d08e33b.c47247b0327349.1577809225810669681@collabora.com>
In-Reply-To: <20240926161450.5022ba06@foz.lan>
References: <98236d10-4024-4b96-a8ce-8e1dc2a34f1b@xs4all.nl>
	<20240917091744.qltmddftdy7bpgpg@basti-XPS-13-9310>
	<bb8c09c7-0eae-4e1a-8fb8-e325fcf326df@xs4all.nl>
	<20240918092454.21884920@sal.lan>
	<20240918093020.u5rz7qfjoumfezql@basti-XPS-13-9310>
	<FR4P281MB3434AE7AEB218146C9CD062CFD6C2@FR4P281MB3434.DEUP281.PROD.OUTLOOK.COM> <20240926161450.5022ba06@foz.lan>
Subject: Re: Kernel CI media test - Was: Re: [ANN] Media Summit September
 16th: Final Agenda (v7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

Hello,


---- On Thu, 26 Sep 2024 11:14:50 -0300 Mauro Carvalho Chehab  wrote ---

 > Hi Martin, 
 >  
 > Em Wed, 25 Sep 2024 22:53:42 +0300 
 > Laurent Pinchart laurent.pinchart@ideasonboard.com> escreveu: 
 >  
 > > Hi Martin, 
 > > 
 > > On Fri, Sep 20, 2024 at 12:16:29PM +0000, Hecht, Martin (Avnet Silica) wrote: 
 > > > Hey Hans and Mauro, 
 > > > 
 > > > I remember also on a very little point regarding hardware for testing. 
 > > > But we didn't go in detail again during the summit. 
 > > > 
 > > > How do we can go ahead here? Are there some test systems up and 
 > > > running somewhere centralized or how it is organized right now? 
 > > 
 > > Testing on real hardware is among our goals, but will require quite som 
 > > extra work. We will likely need to setup lava labs and integrate them 
 > > with media-ci. We had a discussion on Friday with kernel-ci developers, 
 > > and we will probably benefit from ongoing work on their side. I don't 
 > > think there's a plan to address this on our side in the very short term 
 > > (mostly due to lack of time, we're currently focusing on getting 
 > > media-ci up and running and integrated with the maintenance workflow). 
 >  
 > With regards to integrating Avnet Silica labs for doing CI tests on 
 > media hardware with upstream kernels, this is something I always wanted. 
 >  
 > Yet, as Laurent mentioned, right now we're not doing it directly 
 > (but I guess Collabora is doing it for some media drivers they're 
 > developing). 
 >  
 > From the discussions I had during LPC and the ones I also had one year 
 > ago at ELCE, it seems that the best way to do it is by using Kernel CI 
 > to aggregate results from different test labs. 
 >  
 > The main idea is to use Kernel CI for such purpose. 
 >  
 > With such purpose, let's start a separate thread to discuss it together 
 > with the Kernel CI community. 
 >  
 > So, I'm c/c Kernel CI public ML here and Gustavo Padovan that have been 
 > involved on several efforts related to that. I had some hallway 
 > discussions with him during LPC. 
 >  
 > It I recall correctly, we need to is: 
 >  
 > 1. To define a common test set (probably a subset of what we do 
 >  already for the virtual drivers); 
 > 2. add hardware platforms to Kernel CI infrastructure; 
 > 3. add some logic at Kernel CI to execute the tests at the hardware 
 >  that will be made available at the labs. 

That is correct. We can connect labs into the KernelCI infrastructure through a
lab-runtime in maestro or if you have a CI system in place you can just listen
to tests events generate by KernelCI, execute them and send the results into
KCIDB for data aggregation as explained by Mauro.

 >  
 > From our discussions during the Media Summit, my understanding is that 
 > Avnet Silica can help us with that by providing some hardware platforms 
 > that could be integrated at Kernel CI infra and test real drivers with 
 > real hardware. If you have someone to spare, maybe you can also contribute 
 > with (1) and (3). 
 >  
 > Anyway, this is just an introduction e-mail with what I captured so far 
 > to start our discussions.

I'd happy to have a video meeting to look at the details or attend one
of the Media CI syncs.

Best, 

- Gus

