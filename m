Return-Path: <linux-media+bounces-26491-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E627A3DEB4
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 16:34:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD1883A307F
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 15:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 502331FE474;
	Thu, 20 Feb 2025 15:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WrdraW2z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A7E1FC7C1;
	Thu, 20 Feb 2025 15:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740065354; cv=none; b=dBQL6G2CUjlWCvN2K0MwJPWbXSyLmOK+xbEN6yo9RI7TBNv+LT2wMYfT4ZbG2P3W33+wxEqwDMmf7k8/WyvMy4u2YcOvwpl713LTZ2HkYl+UA77AFwAkOUjLmn7sEBXdzgWdB9K374aeURC1fPe9xpP2mPlt/pXm9GKtuKohv4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740065354; c=relaxed/simple;
	bh=eKWU19n0WBr+VIGXdyoC3+/g/6CUv/SBl+AhU83JuOg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=G+/lxLDNinWD/dlWx+ZLJnedRh0GKcFUWAVPd+adgUKYtGG8qYmZ00EtT++24KJFRrV86f61QWnO67GpnAMB2hRGFBwcRdR9zv4YJqWaYsobCGrBNYF79oyUFFv0wawaX2oPDO7h3G9lx+zv1IMTETtwq+/7aQJTruG/BtWLqcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WrdraW2z; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6e6711bbd00so1636416d6.1;
        Thu, 20 Feb 2025 07:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740065352; x=1740670152; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eKWU19n0WBr+VIGXdyoC3+/g/6CUv/SBl+AhU83JuOg=;
        b=WrdraW2zIM/3ia0IuU++DOXLfoXjLfNKy3F3cPs4DQyllh+jkGTyuI8c2mD8T3lzzm
         jAGs36Jt6Jv3cmSIQeznfs/CAyhPfa9UGUfetv9tI+9+Kf4ensqUrh/6cSIijPSelXRn
         cLSMpKOhVr5n3uEvC6ocX+2SNODW48AGb0JANwM0+d7noRrgZDcF/ic2W8ZCNHKpeZ0n
         +EO0Mp5dAyV2KwMmhGSliocBwRCiZix9zq5LduwSzssMcNcsbg/Yq6eQNbt0SjUGPLkG
         PuzBzrIt810grrzSArHQPdZtLWug2RpeN/MOF5l0BiCnwT021o2tKt4W2+z2BZ7mXGDs
         N7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740065352; x=1740670152;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eKWU19n0WBr+VIGXdyoC3+/g/6CUv/SBl+AhU83JuOg=;
        b=Io4+3kLzJUGIt8hYtzpeTcXSvZUyEOSNDnBYZYVN9Cs5EYjp87eS1ZjTu12OIHFb07
         6G5w+5ux80KZwRlk9EikgHMl/90Ow6bWjjwG2L0UtdgL5+lkc3Gn56jLNj0IXK9+31At
         m6yX7p+0fTLQX+axzy44lRQBpdeWYKJnvbFmYug1R/d2gXQZTMEcqclUELI0RUPu5g6z
         XTb7IqFpdud2VF5wQow5JGH0LvJ113UvHMRilc6xZpiYjyYczM8eOntriX/5PiArjfdx
         WKsw5VHB3AUO2nZkqkv0uybcaOylgWtCmls5BOEQeShoX/GavNM8pRRN55IzvR10ST9v
         aOAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPqC975CmTzwGCZZijlcO0/Z6vhum5g59lR4AK9fJ7zX4iVGVG+8fKPOymNpAp5JAAMFj7hjTpZP64FzE=@vger.kernel.org, AJvYcCVmxtPAs+Y2WUk6gFxxbo9JOQSCDo50PL+6VijiKXcfaSSsHUeIYoYLcPSM6QFDJ8EmIBuV1ffhBNdV2JE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjc4xUibZYvrdcgLsiWvQ+AgBJGECapWQQevXzPDHN4j6HnHmQ
	U2k+6q1Q5HdBrTxPbMy5FtMB9LOuy6P+U9/yenCMGtrh0UzTGTN8KmlKdw==
X-Gm-Gg: ASbGncsIbzCxzoqUi8UnFiXI2EwIzBcMNmBx1QKHMEAU6AGTTV9ovqabjii5dP7kTZb
	Dw0Z5F98SpS/QdWb1l2+NfVdHmDEtC92Sv4A953HA5yH9xnBCOnjh624JMIwd5PKOwlCKHPcYF0
	qbTFiDpiwJ1vMZB6R5/5gjKNQFiwJVxokmkbNt0eUxr1HrAgIZBFhtioKpoBc2VYXNF5DmCLiDO
	TxOthhurFfmw+LjtclStOhF+Urivohjng8tmCS+LWsEETY6dCbQvPbaqqaS/QRj8SRNAL4fQDUN
	zNPRzzmh0PUPpVrTRmo5BJ1iQLNimO83XXmtXE17oZtJc/5RiQqxcCrBT/XOCt2VRlrj
X-Google-Smtp-Source: AGHT+IE3BlHjHE+N3vVcpX9SIe1Drmm7gJavU4W/NFg9hMumG9l36jT00FR8pSGnnpptLdmpScHUvQ==
X-Received: by 2002:ad4:5766:0:b0:6d8:8283:445c with SMTP id 6a1803df08f44-6e66ccc47d9mr109692786d6.4.1740065352096;
        Thu, 20 Feb 2025 07:29:12 -0800 (PST)
Received: from ?IPv6:2600:1002:a012:8f2c:1cd:572e:a9fb:7da4? ([2600:1002:a012:8f2c:1cd:572e:a9fb:7da4])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e65d785a4asm87656386d6.29.2025.02.20.07.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 07:29:11 -0800 (PST)
Message-ID: <61bd42742ff8a8e5f409b0f2ccc4ab8875dfe7a4.camel@gmail.com>
Subject: Re: [PATCH] media: vim2m: print device name after registering device
From: Matthew Majewski <mattwmajewski@gmail.com>
To: Shuah Khan <skhan@linuxfoundation.org>, Uwe Kleine-Konig
	 <u.kleine-koenig@baylibre.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil	
 <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Thu, 20 Feb 2025 10:29:10 -0500
In-Reply-To: <5051c252-f1ef-4731-b0cb-fedfcda04d98@linuxfoundation.org>
References: <20250219190501.295976-1-mattwmajewski@gmail.com>
	 <ym5q2cpn2lxk7sarylnf4o3ztvtnb47wroxdiibdsp6yz4gt2y@jfyfo2ekmdmj>
	 <5051c252-f1ef-4731-b0cb-fedfcda04d98@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-02-19 at 17:21 -0700, Shuah Khan wrote:
> On 2/19/25 14:58, Uwe Kleine-Konig wrote:
> > On Wed, Feb 19, 2025 at 02:05:01PM -0500, Matthew Majewski wrote:
> > > Move the v4l2_info() call displaying the video device name after
> > > the
> > > device is actually registered.
> > >=20
> > > This fixes a bug where the driver was always displaying
> > > "/dev/video0"
> > > since it was reading from the vfd before it was registered.
> > >=20
> > > Signed-off-by: Matthew Majewski <mattwmajewski@gmail.com>
> >=20
> > A Fixes: tag would be great.
>=20
> Matthew, there is no need to resend the patch. Just send me the
> Fixes tag and I will update the repo.
>=20
>=20

Ok, here is the fixes tag:

Fixes: cf7f34777a5b4100a ("media: vim2m: Register video device after
setting up internals")

Thank you both for your time.

Best,
Matthew


