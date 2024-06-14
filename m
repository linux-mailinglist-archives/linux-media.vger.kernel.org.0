Return-Path: <linux-media+bounces-13285-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFBE909365
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 22:30:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2BFD28773E
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 20:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 105981A38DD;
	Fri, 14 Jun 2024 20:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="kSPcQwB5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308271A3BB7
	for <linux-media@vger.kernel.org>; Fri, 14 Jun 2024 20:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718397009; cv=none; b=scxsR63aMYSJc4/ieOitt85mAJLkNjleZ2I63tPfad9F9Qg9/DXoe7Q3VNQK+3610dUC524B0mV4++nrCi5RYpg5q5oWhiJG40R8IukB2VcCcLShg0HjrlPpfeRPu6wb5eY9mUmYTSqdIEZPKMkudEOjiF2JDL/o4PARZkHNPxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718397009; c=relaxed/simple;
	bh=oCiYWKj7fKvXvA09gRXC6Z0ywvUJA/RbhazDFE/5KmM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eNHUvzKlaDFUZV+L0uhWi712wnhg0eM5EOc2GeNAqytgJMSs6TJulYHQg6WHOFOKH2m1zbZgenhNZ+2DAn2xaFOjrQzQFC1fzOSVOMCpq1ahhLgrxKaFv2H0AqPx7036JUgsPcQlx4B8H/+QjGxxoIQkORSGEqnt3QL1Racaq7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=kSPcQwB5; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5bacd59e562so1269552eaf.2
        for <linux-media@vger.kernel.org>; Fri, 14 Jun 2024 13:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1718397007; x=1719001807; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xJhJt3J2nxJAuqKZHd0QwEciJsDRhZULynwju7SQhhA=;
        b=kSPcQwB5kX7mCbmRdxmeIrnwoAahgjP0MsM1DqoXov/MfRJMik0kqSwSKYBCRtsTRs
         a+YNHQbwTOT+Pw1Hg4FIob860fqyEHva/LTPVJWESwQ6jn5QUIimmHQ9dKzqKiD/4wEm
         Bo+CQPhLpatLTQQkxHwRtP7XSBmSggGmRD32tpd8+cJ2UjQ4kCu1tCi8a3QwlykSLPGy
         ZDId1bFhvTMAi6Wg48hvjswrpH9cH8mHnL52c1wN8QRhrAIW9JhhG90QEcHHy1kwhGpY
         s6aW6Fav/YKMdgo7lIu/0uBkkY1/LIr5nBPsBR1nZv3EDStu5dhOwoNTXCDQpfLKJe0b
         14lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718397007; x=1719001807;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xJhJt3J2nxJAuqKZHd0QwEciJsDRhZULynwju7SQhhA=;
        b=BSZmyEwBgP8JSDXcjLcqWj0sT6iqBgWt7e8aDek2kI868gRrJhP53hgGLxS0CpTSM+
         MILjMkpmYiZsRpJR3rKqYJah5jBeGLhepqWNzfnzjgoIW8rXxPE7ZizU4soqSfIoRTMx
         eDT+OToSFHkncnCtZzvwpsDWC7PqnlkCwLTwOO1X7ksuqsS+C4uUBH74wjezLXzsxuJw
         eFraMm1LzedRSwd/OX9Jej53LBJ0WJlTqQmdpPfyJzKOemFxqCgwvDfLxEtykrsbVPfZ
         4ElvbVZf7JkJC+HOm90OfU6X7IJRjGMtd93zQkJNeudU9W8jkO7R8Q4mktuCxZqJoTDm
         8sBA==
X-Forwarded-Encrypted: i=1; AJvYcCVdoHcco6MqNFjTwrKOYPopHmfcO6fhTuvlSWC93EeCmUEGyMF3F9m090N8+3kghEPBjDiM85rB/fGwfvvUnwYVNYQn2xJ9riqN8ig=
X-Gm-Message-State: AOJu0YwLh0X7RxNgFbMz67vE16PggWlWJXDlFnfKT4O0Ui2tsBhuGNvr
	v3m3cV5cfDJWUdBCDVRWJZUZvSMBDs9Je+cxvP7nUNvR/k+YLbeH6lipMexbo2auVIVUK0znVP/
	GEnU=
X-Google-Smtp-Source: AGHT+IF4C0ydFkr3IsNAr6Blq5SSboC1En/cdpILPHYan7A2ZMTQYSAcMnFNnwq4qkuN3PHcllTO7w==
X-Received: by 2002:a05:6358:9103:b0:19f:5317:49a1 with SMTP id e5c5f4694b2df-19fb51658f7mr465229255d.28.1718397007051;
        Fri, 14 Jun 2024 13:30:07 -0700 (PDT)
Received: from nicolas-tpx395.mtl.collabora.ca (mtl.collabora.ca. [66.171.169.34])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b2a5efc23asm22245446d6.126.2024.06.14.13.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 13:30:06 -0700 (PDT)
Message-ID: <0faecb255d7e1e67153321d9009f9fc8c0810cd7.camel@ndufresne.ca>
Subject: Re: [PATCH 6/9] accel/rocket: Add a new driver for Rockchip's NPU
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, Tomeu Vizoso
 <tomeu@tomeuvizoso.net>,  Joerg Roedel <joro@8bytes.org>, Will Deacon
 <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Heiko Stuebner
 <heiko@sntech.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>, Oded Gabbay
 <ogabbay@kernel.org>, Tomeu Vizoso <tomeu.vizoso@tomeuvizoso.net>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Philipp
 Zabel <p.zabel@pengutronix.de>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Date: Fri, 14 Jun 2024 16:30:04 -0400
In-Reply-To: <8f93c724-3c86-c0f4-3a84-8a72817e684c@quicinc.com>
References: <20240612-6-10-rocket-v1-0-060e48eea250@tomeuvizoso.net>
	 <20240612-6-10-rocket-v1-6-060e48eea250@tomeuvizoso.net>
	 <8f93c724-3c86-c0f4-3a84-8a72817e684c@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

Le vendredi 14 juin 2024 =C3=A0 10:16 -0600, Jeffrey Hugo a =C3=A9crit=C2=
=A0:
> > +	version =3D rocket_read(core, REG_PC_VERSION) + (rocket_read(core, RE=
G_PC_VERSION_NUM) & 0xffff);
> > +	dev_info(rdev->dev, "Rockchip NPU core %d version: %d\n", core->index=
, version);
>=20
> A properly working driver should be silent by default.

This is not universally accepted statement. Most drivers do have a one line
"probed/detected" kind of report.

Nicolas

