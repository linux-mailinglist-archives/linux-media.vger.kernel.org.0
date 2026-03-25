Return-Path: <linux-media+bounces-56932-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIXZMSlQw2lGqAQAu9opvQ
	(envelope-from <linux-media+bounces-56932-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 04:02:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6F131F01F
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 04:02:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E964A30731A3
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 03:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03B3D2C159E;
	Wed, 25 Mar 2026 03:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hDuegeE2";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="aXxXvFH6"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E951A683E
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 03:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774407716; cv=pass; b=LxP5ZlsbE01R02IBjh4Z6uUZd4yv60vzXje2hE23EdhG6n6vY5G+7Vo2uciODeWRnd8RTRdma04UgbYPOcS+clDdEMRe+LNaLIAceh74FHngC7hKxEAC1VXuT3Jz3MHTN53UdEoKhQoQFlYA/Bj0C5HqN2kv+yN7lk7xDdjb6ro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774407716; c=relaxed/simple;
	bh=c8uuQfVRa+Dt+o2XGFI5BzuN2KZpr2uZGIJvoO2A35M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sEVQVjJVU7Yl1hQXPPq8y4GSOKQz3cvL6vP4S2f1bgdl3MEjGhooJrBSX4XanDjYa3lntmwH3bF8CysHrno8odJD1UTuo7tOaX+VHbiiweYNcQ2e1D22A45qcCWM46TNlwS22ilFK3x4mGn5BwoylU+l6lpwiNMQy9VPpldNKRI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hDuegeE2; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=aXxXvFH6; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774407714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CwLuChi8C3fBUa0FAgkm09m+GW65kdJiiEE5BuFjeoc=;
	b=hDuegeE2ps4W+4O+Jy2L6XkSBqJa7cIw/brR3aRYx5relUu8EFjyeKFHL5HuUlGxpH7SqE
	7DEYzr8o7rSdsj3UvbRvqIIplccEfUQQxItWDTeSxY7EOb16wSGSAWIsLrhbwWEUxDfG0N
	RXGEgYZ6JImhyrGSrrxg1Q7sNrvWEKk=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-378-NJ-HIfRHOxGiGxRolcmh3A-1; Tue, 24 Mar 2026 23:01:52 -0400
X-MC-Unique: NJ-HIfRHOxGiGxRolcmh3A-1
X-Mimecast-MFC-AGG-ID: NJ-HIfRHOxGiGxRolcmh3A_1774407712
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-46a0a8fb1cfso10257708b6e.0
        for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 20:01:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774407711; cv=none;
        d=google.com; s=arc-20240605;
        b=gjWRzOexhbjxJcLkwiKe0vNQzONnGq0YHOMduvP76TPE5GZlMD9YcGWHdZsYTBqtHV
         5/TzDuots1bgAN9BJIDlFaLsQYVxnA3pYrmvDAmeZVfD38PFovAucy/s1SftukaNXq17
         BrxrRac1dFVbheb2kDdXiyPkAVq6vPDuMR2hJTycf1FoI2Qx3DwoORtGhHNcjh4UpUkk
         KM4zDmPXA1M7MGsInbn+WvsI19beU3ZN9VDvBm+tOGEWzaS9r6oS0h7xOFJ3oreqd06Z
         K0W4C/JREKuwy38edZzN7tRNib0o0j5hpabhp0jhaB6i4rzYqxCD40ddhnVAos/Dcied
         1jPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CwLuChi8C3fBUa0FAgkm09m+GW65kdJiiEE5BuFjeoc=;
        fh=XY7U/4ldB7wAlIlywCcl1595XnB1LBb2HQImoS2Los8=;
        b=BVHGt4cupr5kDtvSXsOoLv3lW2bxx0M+K/Ie7IudX4ttUo6NLSG/vGqeO8x9OI+mSq
         mfyuOQzdrGN2RrgCOLsu7Z7w44zj0HL8zodrJrSqTCItf42WLpSKpIgMzXpKb+6jBYdF
         nBQyCoUqCRVM6+YYsNegSb3ehqXTHHqAybeNtQ5/J6BQWgYI8yAxnjEY/0HixpjwuIHk
         QBmVYDdTMitCeG89vsw2h5u79pLAi2zd5WJIc1d/gtPosWybM7m6IycDV3wnom+p8xXn
         vTbaM/zjcXGHWKB2W9yppFLHZb3Vx852TgwD9WtPNIU4t4te4t9hwACvb4LmcthK1BND
         NVTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774407711; x=1775012511; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CwLuChi8C3fBUa0FAgkm09m+GW65kdJiiEE5BuFjeoc=;
        b=aXxXvFH60M+TTo2ZQcoNQ6Pc39uxCMtWCrJFEzPT0W5Rqkp+xp2uH5NJ8CiRf2Rsoa
         w9EtzTf/bEhLwlPsaLYGhVjZdONoJPz5LGwtepTz+YYqkhdu6UsTc5A6mKivuf6JPTpR
         ofw4M1l6aVYDyeXhtQX+VHJaaj+4c9OtjwHFLIc1TNsrFmZYluQdD70g0+JsV/lNRkKI
         6SdXifwb2zfUvkCvkEMyl+slQ9wwbHfXoQZsSFTxbLtgdMEbY3mk2S48Zj9b+gvleOr5
         nv3CYHttaaqhTrgU7DqoyrlwYcaaLPwJKi0hNLQFCBxQy2SnChkRyNsZo9npfn5usKQ5
         l8fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774407711; x=1775012511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CwLuChi8C3fBUa0FAgkm09m+GW65kdJiiEE5BuFjeoc=;
        b=YP/dqpalYBQtH2jvn0myLaZ/MSVDkSQ+osbp+qYkvuRTowmoXxLVVC+3PqmsQOUvcl
         ORKnstqTIew3Y6jcBEypkR2knhhzmGmCBqYZ9m0FBEyEAeTYZDqlUzUkCF1eqbvtWCUJ
         bqXogvT2/0LqUNnp+B8rwvwmLNp3XINBLcJfw+DpGa8Ae0nEro4Q2qFkX4PP4iwz8zZS
         YehPjOUTOIOX0UB9HMyVpGaimuq3IbiYrAFXPSbmw0KXVBjAHvvQWIQ6GUbvGiTWXGwh
         6nipFUvipgo/9SxLZ2TRRzmOxjuTLjjpTPT8LwmLetDMKo0Nn8mOC4s9c2hCyS0YNzx0
         UMsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQvXNyrFKxVQTNja0datRXyNlH2FbDbs6BN/wxz9rY4I0ZT+AlrhlERiNmi7v1mJPBWNQQ9m0rOwrKUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbaLg0vEfGLz5djUdh5EueFRPOd97Qna2APcGBcPHSZ+vXUG6W
	S+O6s6UoFwbpa3mUeyY+p2dEZYpdiczS2t4U9zmyxaOVk7Ex9xNdeW1a7/SUJ36NPlP/k/OKNhr
	xGh7W+vzF15Zj1juOeLsdjVo/ubs3dpeyXJMiK+yl1JMzCjwhMg6Dvm0pp/pYFUZ6Un5h9REBNE
	FNZ1S5lq7Tzg2vmmHJZHJfVa6kCrqO91SQpQ3T213Zvbt6VSQ=
X-Gm-Gg: ATEYQzw3xBGH/86E6gvMtj393n6t5SCMHQQb8lIBknG+DWerqYRyGM1n6Zgd1WH/4TV
	NDJ6X9PTshUCK6WdtxLWoz0+XPG0yeLN23gPW2FqqhF2FMGkEqMeD3JeEnOvZZJ/7i5RAdz9AZa
	gbVKO7xShwpRmyJYdCcA80ajKEaRtAliLgHqcV+7Oz+UOEaGUef1LkshI72Kz4NYK9ZfzabTK5Q
	08JmA==
X-Received: by 2002:a05:6808:c166:b0:45f:434:9c1c with SMTP id 5614622812f47-46a5c5a5decmr842827b6e.12.1774407711401;
        Tue, 24 Mar 2026 20:01:51 -0700 (PDT)
X-Received: by 2002:a05:6808:c166:b0:45f:434:9c1c with SMTP id
 5614622812f47-46a5c5a5decmr842819b6e.12.1774407711035; Tue, 24 Mar 2026
 20:01:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323071647.38086-1-hpa@redhat.com> <0532e7b1-b3c5-4bb3-80e4-76db00c385ea@kernel.org>
 <acKREpGPr1J_1Oaj@kekkonen.localdomain> <63e50918-60d3-4a01-b28d-77c8580f1260@kernel.org>
In-Reply-To: <63e50918-60d3-4a01-b28d-77c8580f1260@kernel.org>
From: Kate Hsuan <hpa@redhat.com>
Date: Wed, 25 Mar 2026 11:01:39 +0800
X-Gm-Features: AQROBzBc1nb4vq06OBlhAszo3eugTasLyVRwQ5jIaDuXSbKDTqraSmhFcUrqkmM
Message-ID: <CAEth8oF=qr4KAOSRU29n5DOhaAAo=VH9gfp7r25n0vwkuhfduA@mail.gmail.com>
Subject: Re: [PATCH v12] media: Add t4ka3 camera sensor driver
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Hans de Goede <hansg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	TAGGED_FROM(0.00)[bounces-56932-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hpa@redhat.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 4A6F131F01F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Hans,

On Tue, Mar 24, 2026 at 9:48=E2=80=AFPM Hans Verkuil <hverkuil+cisco@kernel=
.org> wrote:
>
> On 24/03/2026 14:26, Sakari Ailus wrote:
> > Hi Hans,
> >
> > On Tue, Mar 24, 2026 at 02:17:38PM +0100, Hans Verkuil wrote:
> >> I'm missing an entry for the MAINTAINERS file.
> >
> > Thanks for noticing. I already picked this and it's in a PR... there ar=
e a
> > few other (minor) remaining matters, too, which I asked Kate to address=
 on
> > a follow-up patch. Would it be ok to address these at the same time, af=
ter
> > the driver is merged?
> >
>
> I prefer to have the MAINTAINERS entry before I merge this driver. Other
> minor matters are fine for a follow-up patch, but a new driver shouldn't
> be merged without the corresponding MAINTAINERS entry.
>
> If Kate can post a patch for that entry tomorrow, and you Ack it, then I =
can just
> add it to the PR.

I'll try to propose a new revision of the patch today to include the MAINTA=
INER.

Thank you :)

>
> Regards,
>
>         Hans
>


--=20
BR,
Kate


