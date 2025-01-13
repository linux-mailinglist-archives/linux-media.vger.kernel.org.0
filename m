Return-Path: <linux-media+bounces-24706-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0274BA0C2A7
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 21:38:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB6DA3A5599
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 20:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9E6A1CD1E4;
	Mon, 13 Jan 2025 20:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZSR/ut2Z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017641BEF6F
	for <linux-media@vger.kernel.org>; Mon, 13 Jan 2025 20:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736800734; cv=none; b=Hi4+vZ5d9OXOn53TducUjSLngC1PldxxfPswshUr92QhjiZgEWiL1CSpc0+ARF3ve+nQ7TuusfI6LfOJD1ZxSUEZMEOICDklE41ZUCbhC7/0GWjvK4a8l00/MXexKtUERoLqWO2xYSQ+xresi/3ze0wDCvANMYhNwJXp6cxtnD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736800734; c=relaxed/simple;
	bh=UF//EOt9SFppYiWCVbllnEfEZK/IThCiSVMaLRoAD7Q=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=c3HuW2qhJ/p/zkjO5yRhUHM+mJh4/oxqbjTQZkGo/yrf35tBO7VnHJobbHA55ULKHnW/sKuPSkeZbo56h9oGeM2BOtEFSVB5r5yNpl98xI9DpGDjL5gw60m+R50BsMWImtlPwJtRJGKH5tUsvNAVLGicuPeK4UVhdwY8PigYtD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZSR/ut2Z; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2164b1f05caso82870235ad.3
        for <linux-media@vger.kernel.org>; Mon, 13 Jan 2025 12:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736800732; x=1737405532; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UF//EOt9SFppYiWCVbllnEfEZK/IThCiSVMaLRoAD7Q=;
        b=ZSR/ut2ZZdQx4GqXu8vKMRuurXaf5eOj4St8fyH+y5L0j2Eir6a8H318flaSSZBuV8
         26QvTvkDtmG217bxnyeFlta/9cSCLBj61uEhHLUkUPc0CewME2mousgV5SXuh0/KvGmu
         iE69yB1SUTGMe8kyP3ggF7S6fCRBy0R+bepe6OlUdmtX+85VZOdwsV7mZEX24dIaFExe
         KA74iCXyd95CZtWVPAEVvSqJ/jR1KUAZd0D1/PLeJ0SRkdQLLlK3xuSGcitmCq6QOpVl
         ecxxHhhiwpkn46x5JqpLI1rdPyhURh6jNCZWPVaRzBr/+NJ1el0nyeqKhKybIb7uU3F3
         3o/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736800732; x=1737405532;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UF//EOt9SFppYiWCVbllnEfEZK/IThCiSVMaLRoAD7Q=;
        b=Izv2PQRNICnY10DQtGbI0kjxbbZGXh3jTJzpJuDiM/PKzIVERTBlFepxYjLNvLJPjC
         jIkgdvYbaRhyOmtxzI0V/p+ru81Jmj8hPXPTF22MCwmunUwrtRHgDhJJTdYk2InSAx7E
         6Gf9QMB5YZGJRB/9+0wKxhU+nxJZFDXP75X6tyFwHjzHUSTfgncWR3JPzC8vOdsIkpL6
         AI/6b567JHWAo+GLiSIc53q+LPYLsdPa6EnxM7ARt2ftz+qOP26R4oJszWsG+cqm3a5z
         R5Qdz6P1qLZLoUdF38fLHVZGSdlNcL1jDvTaIBgwuoSt1FBDePzXqkOmiadVP6DoQpco
         LiKw==
X-Forwarded-Encrypted: i=1; AJvYcCVKjk/SnIcIrQkQy0k2hQZNBK+JHXw/pZywRQP/JPPBvTys2qLsHCC8WMYDyiuMvt7jleC+F7LAvGejIA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzti5pZRrqKsYS90j8Apdjh9DH/qIR/I4MFEx9+6AqvoshCLiPb
	8rq9CYUp/6xv8vXfFtDdhdOR/P7ihOlqmKQr5OJqf/PhTAFNjXpi
X-Gm-Gg: ASbGnctwoJfXVIX1HEQAir+cB7Feg+2o/f4MNc4mz2WhNj/DNFcY9S1mb8/34Q8TdZe
	CLADvGElPWa6LlYT7IlMJMe15zNpfRi/KVp+p1p96selJ5YpxTT7mN8Jn5iSyzvi33xumQun4jv
	9I4g+juukxohTVde73ewTzMCAQu+Rp3LOKvt/S9LSa4mjOCgg6NchEvPnexA+Xycf1gjzhYvR96
	La20dzLT1+I62pmWSyISid8YcwGyADh7toTjuTuPpnaSGY3y/xJ6I3YjH/KJdeGSOTpgT/sgvua
	t1LZcJ1JDg==
X-Google-Smtp-Source: AGHT+IH1XJ95fYSlcd/SGjZQdTq0CvdDBecEoecITGT08cjN+hBKQa2u1NdEuQ6tXFuOD60bQHYqiw==
X-Received: by 2002:a05:6a21:2d09:b0:1e1:ba54:ffee with SMTP id adf61e73a8af0-1e88cfd3f88mr32208800637.21.1736800732159;
        Mon, 13 Jan 2025 12:38:52 -0800 (PST)
Received: from smtpclient.apple ([2804:18:114f:41b7:8121:40df:6d4a:e6cc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d40658dd7sm6484505b3a.102.2025.01.13.12.38.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Jan 2025 12:38:51 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: Hantro H1 Encoding Upstreaming
From: Daniel Almeida <dwlsalmeida@gmail.com>
In-Reply-To: <CAOMZO5BJt6qzETzMeO47N5Gu8136tppuXKnqv4ypk6HyLR99vA@mail.gmail.com>
Date: Mon, 13 Jan 2025 17:38:37 -0300
Cc: andrzejtp2010@gmail.com,
 Frank Li <frank.li@nxp.com>,
 ming.qian@oss.nxp.com,
 linux-media <linux-media@vger.kernel.org>,
 Adam Ford <aford173@gmail.com>,
 linux-imx@nxmp.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <F5E2D925-668C-4D4D-87C9-8F22126443FD@gmail.com>
References: <CAOMZO5D0QvYvr940giHPGwLpunQOpku7e5K_5hHyYYCwZQry2g@mail.gmail.com>
 <CAOMZO5BJt6qzETzMeO47N5Gu8136tppuXKnqv4ypk6HyLR99vA@mail.gmail.com>
To: Fabio Estevam <festevam@gmail.com>
X-Mailer: Apple Mail (2.3826.300.87.4.3)

Hi Fabio,

> On 13 Jan 2025, at 17:28, Fabio Estevam <festevam@gmail.com> wrote:
>=20
> [Resending because Andrzej's Collabora e-mail bounces]
>=20
> On Mon, Jan 13, 2025 at 5:25=E2=80=AFPM Fabio Estevam =
<festevam@gmail.com> wrote:
>>=20
>> Hi Andrzej,
>>=20
>> Do you plan to submit a non-RFC of the Hantro Encoding patch series
>> that you submitted earlier?
>>=20
>> =
https://patchwork.kernel.org/project/linux-media/cover/20231116154816.7095=
9-1-andrzej.p@collabora.com/
>>=20
>> I don't have access to the ST chip, but I am interested in using it =
on
>> the i.MX8MM and i.MX8MP.
>>=20
>> Please let me know.
>>=20
>> Thanks,
>>=20
>> Fabio Estevam
>=20

Andrzej doesn=E2=80=99t work for Collabora anymore.=20

=E2=80=94 Daniel=20


