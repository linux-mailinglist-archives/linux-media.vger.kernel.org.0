Return-Path: <linux-media+bounces-34268-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D25AD067C
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 18:17:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B12217AB596
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 16:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4A0B289820;
	Fri,  6 Jun 2025 16:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J80/7doU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B46025776;
	Fri,  6 Jun 2025 16:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749226645; cv=none; b=svis3XUg5FGuVP4eTTmo2jCqOOXMJOT+S3KsLLKMWvTDa+9tgW/b1yptSy14UBCS8/isjUGVV50o4LFfv6ou5eCrlJ/0G+7K2E2a2BIfSXtrPF4XgdIbimp41ubSRnCekSg0MBMLW43WiqSsSFr5PYR5xzxUxYNkLu5YHuciC2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749226645; c=relaxed/simple;
	bh=AJH8Xht7LgFTcE3HlorlUpcubTIYPJN2EmtJ6m0tPCc=;
	h=From:Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:To:
	 References:In-Reply-To; b=l2+YkJl5O4GLFFSTnLblIAIu/ajHhPBGs+wIySuhkXlskWh0QPDCxbUyjzHiUWfhfa9b1OmDH1WJpmEVJzxluhwCHqPg5XJALl7X/fjt9ttrxzpsvr08GpDmOlaCZJouhw+e+HoZ189ZQvyWO67Wk9oiQMv0v07lg+EhcFRctus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J80/7doU; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a36748920cso2198239f8f.2;
        Fri, 06 Jun 2025 09:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749226642; x=1749831442; darn=vger.kernel.org;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4NlKIg2a1lGubO5sNSfmyFBsfmLI6eZhDm94jolhDTQ=;
        b=J80/7doUL8IsXjXPpZ61qYwSmdiZjhVT2U1y7/Z99iIE1cCRUAEJ8ovDLOSYNiLkrq
         Ghfl3PRimXRiQ2UGtp+0LL9lvYbwtN0j7/EVyQIRdp2e/KVzbAyeQsl0xlyROBh1oChq
         k+kIcVi7B0gFzhiezV8hsrJj/Kt6MenbVN0mnrwVXd9Gk0mARMuaQ0/6tRT70zeGsuIw
         NS06jmm8gSjYBHGgDdh/lwZdlAEPWu7gxXx8UjnLA4NXd+rr/PUMR6CvJZDNrVjbQhvf
         ONlPsDQgRokjhYi4X+3d2+U7vsy7QcKFs+A59zpMg4GzsRVnEyy99c6Uo4pa6icZSaPG
         zjbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749226642; x=1749831442;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4NlKIg2a1lGubO5sNSfmyFBsfmLI6eZhDm94jolhDTQ=;
        b=WUUJJ5lsTOrGwzAo9Hq7hajESfcccv1UnNRHKdF/AE4A/bws2EgMimXd9Z3+Vc+J96
         phN73gaecKGC0P3esW9qbIOc5TeA1iO76dB9MYYmkTGQCsuIFSp5UevsFHJo0SUDK1ST
         0KhUWoRsDNB/WFcaAa4aS2T5sHsxeNDxIA9UkQfDchqvfCs0VS6F/IBzG6R4lE3Gbes7
         51H9WZi4LAVaOc/JhCBhti3eIKUjfZobRL+IyFMfY7IELP/ZduZo2pf6C6K/Z2df4evS
         ZvggFJtiG4i7DUILEOKyCMgLRthk+5rcB4m5VdIZBRUF6RAtGkuOP1jtwWmInZqOG3fl
         XUdg==
X-Forwarded-Encrypted: i=1; AJvYcCVney0csTk4+cMwl2BGSFBjCS0BWw4jlaEmwDi7Zw4mlZeRGIdKhtvI1iGkrs4pW6nCXManDjORmNwZFFs=@vger.kernel.org, AJvYcCWBHba2jFJFg9rza9qLGAx10XNB6BGvW4qt6WVad36UN87QV9xoz+3P3SaY0xFi0fokgVE8WoU8JssIFjE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzll+3hA2mGD8qcEco3dZbGDuk2+/X+ouca2Ec5NbtqEpdSnoRX
	hYOs1QnUH0XQVo3EW8VX7ueZWpYNbXiqJ2kji+MoG4nGlXzAkfT/vcNG
X-Gm-Gg: ASbGncuzW0kLrkzSFCJ70cjXawTK5LtOj3OYp5eqjDhRce7XwjriZvD1Oa74dt1SsCM
	OttYFnrJR5RP1vbanF5bLdvj52PhSP9Ucq1ym8k4o3C8zP00eoTndVITRKwJjOGYYataQq1DsJE
	6DVwWs72cs6S0gFeVUqWuE01k+7dyKdpIgw/QsxEYijEajiYodJttKwBp2IlB8Mykt/COXlcToQ
	oOKoCcRPMN6ASbYAisFQdMm8/rn1neb1hOJPzUrn/JMtfNBYbatL2t36eLTgJDtXrAiQz2o1Bvp
	o8FtHG2nJgxQd/7z9NnoOo8OaAvKRQRjfxZCLSbAwpifL3S/Ou2+NOVJEEgPhoYACEqDK3E5rCT
	MWLorD0CEhVtj9g==
X-Google-Smtp-Source: AGHT+IFEPwne2ttMNKIa+n0ICE8jkRX3AQsfZ+fAiNXrpYKRs5y4Ypd8txsA2x6HPfCUIi/0m2BD+g==
X-Received: by 2002:a05:6000:25c7:b0:3a4:ee36:ee4b with SMTP id ffacd0b85a97d-3a53188238cmr3679704f8f.11.1749226641555;
        Fri, 06 Jun 2025 09:17:21 -0700 (PDT)
Received: from localhost (a95-94-245-170.cpe.netcabo.pt. [95.94.245.170])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a5322ae43fsm2281609f8f.25.2025.06.06.09.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 09:17:21 -0700 (PDT)
From: Rui Miguel Silva <rmfrfs@gmail.com>
X-Google-Original-From: "Rui Miguel Silva" <rui.silva@linaro.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Jun 2025 17:17:20 +0100
Message-Id: <DAFL3CTS8R5D.1FIGCAM5SXJPL@linaro.com>
Cc: <kieran.bingham@ideasonboard.com>, <rmfrfs@gmail.com>,
 <martink@posteo.de>, <kernel@puri.sm>, <mchehab@kernel.org>,
 <shawnguo@kernel.org>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
 <festevam@gmail.com>, <linux-media@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/2] media: Add line end IRQ to imx-mipi-csis driver
To: "Isaac Scott" <isaac.scott@ideasonboard.com>,
 <laurent.pinchart@ideasonboard.com>
References: <20250606154414.540290-1-isaac.scott@ideasonboard.com>
In-Reply-To: <20250606154414.540290-1-isaac.scott@ideasonboard.com>

Hi Isaac,
Many thanks for the patches.

On Fri Jun 6, 2025 at 4:44 PM WEST, Isaac Scott wrote:

> Many boards, such as the NXP i.MX 8M Plus, feature multiple interrupt
> registers. This series refactors interrupt status register debug handling=
 to make
> it more intuitive to add other registers such as LINE_END, which has an
> entire register containing only one interrupt. Previously, the
> mipi_csi_events[] list contained a debug enable field, and this replaces
> that with a status_index, which indicates which status register contains
> the mask for the interrupt.
>
> The second patch adds the user line interrupt, which is useful for
> debugging, as it allows a user to trigger an interrupt after the MIPI
> CSI receiver has counted a configurable number of lines. This can make
> it possible to discern the true resolution of the image stream reaching
> the CSI receiver. It adds an entry to debugfs which lets users choose
> how many lines are needed to trigger the interrupt, and can be disabled
> both within and outside streaming by setting the value to 0.

LGTM.
for the all series:

Reviewed-by: Rui Miguel Silva <rui.silva@linaro.org>

Cheers,
    Rui

>
> ---
>
> Changes since v1:
> - Moved from magic number to enum in status_index
> - Clear INT_MSK_1 in enable_interrupts() when on =3D=3D false
> - use local variable in set_params() as in the interrupt handler
> - move interrupt handling code outside of spinlock
>
> Isaac Scott (2):
>   media: platform: Refactor interrupt status registers
>   media: platform: Add user line interrupt to imx-mipi-csis driver
>
>  drivers/media/platform/nxp/imx-mipi-csis.c | 107 ++++++++++++++-------
>  1 file changed, 74 insertions(+), 33 deletions(-)
>
> --=20
> 2.43.0




