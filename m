Return-Path: <linux-media+bounces-17786-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2311496F697
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 16:24:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 896542855CF
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 14:24:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F24681D0DC0;
	Fri,  6 Sep 2024 14:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="ndLASrEc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157251EEF9
	for <linux-media@vger.kernel.org>; Fri,  6 Sep 2024 14:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725632644; cv=none; b=E6XanuprBPxQ/Ho1IJyqn0qyGwA/sn4a/bAak0LJoGzQ0a0wycLyxuuEOXYy4aTuc9ah/uaenPLX1r5bpKIuM47vFIsSx6sRNvsBNgMkEM+ARU5/L3zwykGrM4fxd9e85KJTSZhaiSMdwk6nxSpV/yX8ZhmEfVNlZVMUl+QuIGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725632644; c=relaxed/simple;
	bh=eo0Q+6cnkOr7o0NmPk6jAgUtpHNsCEDu/s9uSfad5F0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TcuHD77x0AtvrLMlV3ebVVv+HI1AusJjX4vXSri8CvKjxmNLfoh9ZGFEIrBW+mLfBC/qanBxeIiIY6xybBwRhvcq737PXA0UowruRhUpfx4c9nIWsaKYbSsOMLnBX9ARTk8/G03H/v6LPLiS74uVKYLlzUdQh0pF2knCveGc7DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=ndLASrEc; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7a99fd4ea26so17244285a.1
        for <linux-media@vger.kernel.org>; Fri, 06 Sep 2024 07:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1725632642; x=1726237442; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eo0Q+6cnkOr7o0NmPk6jAgUtpHNsCEDu/s9uSfad5F0=;
        b=ndLASrEc727nJ3cENnbVVBljHN47B+NRsWN3r4v19Ded/exv2Iztc7RR8SMVdgHj4V
         0cDC0eFeBAMb+rVEdDfXt3Bag4v8gKNXBhwVMBZ1/YgOlmGASOrSv77q4fV9wEfKHs4t
         RTZaQONW0gSWaI8YcXTFEVRueJRhPMu4aqAn5lx0bL39khp0kSYjk6+MVKAxIb7DguCF
         9y/opeQhzVNFTsZ4Ca/9Y7zDamQ36CHMJimY9yeZ0Mhbgp4UpL+5So26Ifx494b4iv4I
         G5Ww55hteICbH+5/VM+qLPoDR23AenodnnLepkPuuY2n6ChI9vjFaxoIuWxW1gs6auUG
         YxVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725632642; x=1726237442;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eo0Q+6cnkOr7o0NmPk6jAgUtpHNsCEDu/s9uSfad5F0=;
        b=qq1wKckXXqn0ljl43m9H2i278BSJ4rMy8gHoPB3sAMWcOX9GF+v7iGorooD0bxgzHf
         gEp/EA+bwjhJ2gfnH33EZOwRJ++RvsgA+FoeEtINZteEMs6or3fBf1/cp/foNzCmy162
         VzBeWYy9O6Yhskzl+aHqVgoy/yhktdrQ8d0VGUXEoi2W+8/jCuzKuf1w+emWE0EFwcy5
         kOIUshkFFRkZgbfIMbNwsgeEmmN+ajNOVpj3fFgxRRsDZW6tQt2ujqdfZeCy2omW8rF/
         lML2hP1rBlTk1tssefGBFppilEMfkTZjY4UGlTlrcyhxRAwYxFBU5EeVfbM+tWznxFx3
         Kl1A==
X-Gm-Message-State: AOJu0YwO62zEEYqhpd4s7uLtTpUxvIvjMrRCaUIGPDiyCziu7trtQquy
	rxyLyVcncTgZSto/SXRCxh28l6TNhC6VHEAai97Sk7K+zyzwASRNfyieyQSid74=
X-Google-Smtp-Source: AGHT+IFu8BwsymLeAIrelYbaM/0c6oyYjHEvYlhCuyZ8fCeq7pGqeVlRu1klXJ9a5KUroR8FtA/eMg==
X-Received: by 2002:a05:620a:4496:b0:79f:18d4:d613 with SMTP id af79cd13be357-7a8041ea07amr3152683785a.38.1725632641856;
        Fri, 06 Sep 2024 07:24:01 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:17:9cac::7a9])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a9a119487csm13823185a.101.2024.09.06.07.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 07:24:01 -0700 (PDT)
Message-ID: <f7fbfc209bd00e2d6054bd27da8dcdd36574c099.camel@ndufresne.ca>
Subject: Re: [ANN] Media Summit September 16th: Draft Agenda (v5)
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Hans Verkuil <hverkuil@xs4all.nl>, Mehdi Djait
 <mehdi.djait@linux.intel.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Daniel Almeida
 <daniel.almeida@collabora.com>,  Mauro Carvalho Chehab
 <mchehab@kernel.org>, Sebastian Fricke <sebastian.fricke@collabora.com>, 
 Martin Hecht <martin.hecht@avnet.eu>, Tommaso Merciai
 <tomm.merciai@gmail.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,  Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Ricardo Ribalda
 <ribalda@chromium.org>, Michael Tretter <m.tretter@pengutronix.de>, Alain
 Volmat <alain.volmat@foss.st.com>, Sean Young <sean@mess.org>, Steve Cho
 <stevecho@chromium.org>, Tomasz Figa <tfiga@chromium.org>, Hidenori
 Kobayashi <hidenorik@chromium.org>, "Hu, Jerry W" <jerry.w.hu@intel.com>,
 Suresh Vankadara <svankada@qti.qualcomm.com>, Devarsh Thakkar
 <devarsht@ti.com>, r-donadkar@ti.com
Date: Fri, 06 Sep 2024 10:23:59 -0400
In-Reply-To: <5d6c6fe7-5f27-4cd5-bd6f-6730b22872a3@xs4all.nl>
References: <c50f4bfe-6d72-426e-9595-5c8b0751c08b@xs4all.nl>
	 <t4ujthhuzq4mf5m2ny4e5buw7724g7oh34756d46qeauagfhsd@ke2xcqjtqdqd>
	 <5d6c6fe7-5f27-4cd5-bd6f-6730b22872a3@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Hans,

Le jeudi 05 septembre 2024 =C3=A0 11:29 +0200, Hans Verkuil a =C3=A9crit=C2=
=A0:
> On 05/09/2024 11:25, Mehdi Djait wrote:
> > Hi Hans,
> > >=20
> > > Remote Attendees (using MS Teams):
> > >=20
> > > Rishikesh Donadkar <r-donadkar@ti.com> (TI)
> > > Tomasz Figa <tfiga@chromium.org> (Google)
> > > Hidenori Kobayashi <hidenorik@chromium.org> (Google)
> > > Devarsh Thakkar <devarsht@ti.com> (TI)

I'd be happy get the MS Team links too. I'll try and join from 11:15 discus=
sion
(5:15 my time) as multi-context MC is also something I foresee as a solutio=
n to
fulfill our gaps in regard to support Vulkan Video standard.

I'll try and stay listener only as I understand too much remote interaction
breaks the flow, ask me questions if needed.

Nicolas

