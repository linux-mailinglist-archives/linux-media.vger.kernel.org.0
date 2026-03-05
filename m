Return-Path: <linux-media+bounces-54645-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEUSKNV+qWlB9QAAu9opvQ
	(envelope-from <linux-media+bounces-54645-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 14:02:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DBC2124BD
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 14:02:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 509253002F4E
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 13:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06A7B39659E;
	Thu,  5 Mar 2026 13:01:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3F7396D27
	for <linux-media@vger.kernel.org>; Thu,  5 Mar 2026 13:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772715713; cv=none; b=DxHAxFIFM78Moutiuv8iQQg92OAIpnhLYPCP3MXw4U4IrUsu/QQHzWG9FEGKKmMBAMh31WdUkVHeXIFMOtd3lIc/0/ApRefij730DIMxutzM7q1aMJlEqj6iRlBlVILK4UdnTIsNyooKEUWo0ifIMJcCMt20pH5+LkFw0Z3IK40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772715713; c=relaxed/simple;
	bh=mzxuHFEBJ8rIbeR5gmZexUBLMULkEpRVqRmwwCFyU/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SdXfxmNg5b3UesVlPAvwn18zFUYQ5l1HPFeEbB/eCEkZYWA92Hu7BemczR8n1KQ/AUGevbJuVRyeqLHoPG/Pxa8VPEy9J3JqIgNj7SI41QpXWn4eWryIGhp7MBxsdycUQv5jwI8gFBJv5yQahqShyxs1WCoyUC/+D3VENxCV8ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2aae146b604so60896615ad.3
        for <linux-media@vger.kernel.org>; Thu, 05 Mar 2026 05:01:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772715712; x=1773320512;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7IxpxVkGnClS/pzWnTPcTEx+bl+pPZR21vGpLksfVXc=;
        b=o+OtXL1B1ECDKzEGWFWq5cKq9042S/71FC9JbKIZrENp28lj5YBIHIUJQS1AiVDm8c
         yHO8HWuTbOz9FcAnrKNgR/tnKAg9ApPbHhZcjbtEysNLiqWkFHoft8VRFhoL38KejqqF
         Kw8QusEx/jx4q8+klwOjlDH7KLCHoOBBYXaBQbxnq3AJc1nZ/y7ExkTnmeJnFP0xUGE3
         hJqJu4YEJYGoKQMi59CVdmWBRzsswRK9su+6WAD4zxflIKj2N5VY2BgNRsnjdaoIlpvy
         yaZcQRs8quQXF97RJyWbVDbHy0MJw4kQ1C5j2DpoNXqiGXMo97cGRiTcyjuSrj8oFOPU
         26QQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpzW+mI7aFiIcxkqYPK6vteirV+9hs5QfUBAi7MFCh48aYCkLNEtLGK9FXgpT5/1r0/3gXWxdWbmSUzA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKl2dpJY80lhbDY0nH57FCs83Jy/JLMy+JgPXYK/DZiDiWKOph
	Viw8wQ+wciY2SfNrWFurNmEGKluolCcvOZ33Nw4/AxLAA7oz0+wfvTna
X-Gm-Gg: ATEYQzwhDaK1CiWrD+OgBy8Cz4S+GnoPemYZwghMhQ7CyvVu82ZkCbqkZ/+hdPrNw8p
	a932v2+2tkLgNW0Si89ewxOdlO7E+j6ROGWvPFA+ZWCccbDbv+n8ELofg6SNs9cQma6b0kysK5c
	2hmHHow7dmQzdoprEOqiv8wmhTKJJyBm110AbyUiDno4/FMVLjNmA2eZJ0q6JzV1RqXU27ZPNqZ
	8sLPc8Lq8f1z+eX50gTWPlJyM/lhjZ93J0Nl9hJGmVJkRiCXSaMk0DRzEfskbVA/zh8oYF7+o5e
	cVqX7iTazzLYS9Da+u1oOMxxCzjP8MbXAJqVPtz4mWv02uzyg8TF8eWOVylNihIk8Wfm/yVHjA+
	soq+70+KsGDy76g8msj5RKibCpR40Ln5UVVcVPmfpGJKCfV7CCU7Un0iQOCA6Ul4QA92MJGUfbB
	gv9SqECsvSFr1jxW2mEgC2bqdZhfQ07fHwkKZU6M1JoTT35fVthpZXjYrs+hqhqwNgGkx/V9Ej+
	aongGpfSMn6aVP2mqvK/JSQSxUb+iRd96CPr6lQVubD5XUNPnrcu0XgtHn/fw==
X-Received: by 2002:a17:902:ce03:b0:2ae:5b52:3818 with SMTP id d9443c01a7336-2ae6a9deb2amr60551085ad.8.1772715711782;
        Thu, 05 Mar 2026 05:01:51 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae54136b28sm115696425ad.73.2026.03.05.05.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 05:01:50 -0800 (PST)
Date: Thu, 5 Mar 2026 22:01:49 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>,
	Joe Perches <joe@perches.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
	netdev@vger.kernel.org, spacemit@lists.linux.dev,
	UNGLinuxDriver@microchip.com
Subject: Re: [PATCH phy-next 22/22] MAINTAINERS: add regex for linux-phy
Message-ID: <20260305130149.GA1659133@rocinante>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-23-vladimir.oltean@nxp.com>
 <a8fee1cd-1e69-4a9e-8533-c0988c480fb9@oss.qualcomm.com>
 <20260305085148.7cwo3yflp7vcfldf@skbuf>
 <f3a5aa3df78553ffc0fd0024f5fd36a4e2158c88.camel@perches.com>
 <20260305114352.2f7btqixg4tu5bzl@skbuf>
 <20260305121532.GA1649635@rocinante>
 <20260305122957.GA1652563@rocinante>
 <20260305123956.ojkt4k3ly64xz7fu@skbuf>
 <aal6kWDx_3XRGB4K@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aal6kWDx_3XRGB4K@shell.armlinux.org.uk>
X-Rspamd-Queue-Id: E2DBC2124BD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.86 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linux.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54645-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kw@linux.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-media];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hello,

> > > For content match, it could also be:
> > > 
> > >   K:    phy
> > > 
> > > I believe this would match everything of interest?
> > 
> > Yeah, and way more. Think USB PHY, network PHY, etc. Don't want to drown
> > the linux-phy mailing list in unrelated patches, either.
> 
> Also phylink, any memory management / DMA stuff that happens to mention
> "physical", and probably numerous other examples.

Makes sense!  Sorry for the commotion here, then. :)

	Krzysztof

