Return-Path: <linux-media+bounces-33516-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2051AC6818
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 13:08:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77CCA9E39DE
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 11:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C8C827AC54;
	Wed, 28 May 2025 11:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b6qL6lSp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AB818DB03;
	Wed, 28 May 2025 11:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748430471; cv=none; b=jF/fXKQlaKb4utv8vVjVrilDqnAXffO4HZbxblot5AjwWBXk1ZveeT95b5Vm7roVbQT4+BfOoEqIILxfnWzdMwidVO8ubpk4YecFRfXTEyi4cBMcV6fCvLjVpKYjwkVCReMjYDUm3XpAt2PnTuGa0psnsOQjfcIhBLLjbpJUO/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748430471; c=relaxed/simple;
	bh=jF/5ubFo89BoEZAJxrybV/UPR1THG6liaCfHYoxNyQY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sCD3b7z02W1LLpe+huiluNBb2LlcvrSmn+7l1nJeAwW0ptNrRdYFd2I4wOgDIPZuZ5m/mkMOqCYgVUjk2IkcPirUIcPj2Inl7WYnFeonxEobA53jRtCBWEo7cOhLlhSxMZymiZqluusC9+APmLyQQhiZG4O+biMpUEU05qiDPH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b6qL6lSp; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30f30200b51so45438671fa.3;
        Wed, 28 May 2025 04:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748430468; x=1749035268; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jF/5ubFo89BoEZAJxrybV/UPR1THG6liaCfHYoxNyQY=;
        b=b6qL6lSp+TO++Yk9IN5BKjSS4hGsMaa0Cm5Hfs2vPno8sKnkhYvB/TA+MQChRulII7
         I5kPPk01XKd9gqODSidUtUHgcsdbth8HYW8qM//6oVDrIUPx5ddGFs709K+T1tdi0G5i
         3v8j/s3hC5WFScpDcR2h8aHwxSxsIKmBKME75UHkdQHv1g1In7aU8CuW0rzJCSYo0Ubv
         5ARDr+gDG1yaNPsiLNn2tWP3kscl2Ho5/rHIdViWqlWh9O0ANX85b/wMzPVBLtZuDWNq
         QbRX3p7QBGAqOVghobhEEGmb7A9ievWEdPnCP+vhIWvzLYIWzSNMeTKVvcbTpAKahdzE
         vA5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748430468; x=1749035268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jF/5ubFo89BoEZAJxrybV/UPR1THG6liaCfHYoxNyQY=;
        b=rO02wN9tgThCCmV2QSrwRNoaezEGnAy2+1G70SSW6FEy4hCgn9PLiF+Nwsyl493sSU
         N3LSJuVo5/6xgY3MSJ0YFs7b11JC5ych0BykIHuOMC0ySXjk8vesr/LIe4ljxe+gQIaY
         5glrwA0zXdretXeRVQwQQkxB1s7Frlnhznp299gdpL9FuPa0WwsaRAsZtKwR+Tlg2GBl
         KSImf4OIPNCejcx2tV+8+5cAbR7dyWS7nHyPNZpNoHEyBuvqB0B5H3iA+kK6lcLtF6oi
         UQM8PObI/zWspjGSKChcc0jcXmpUE1DcaDHMmyA+rFPBF5YFoFbNQCkvxWIA6NAjMQx0
         iY6g==
X-Forwarded-Encrypted: i=1; AJvYcCUn8kDdt1nYlMA3GlGQXHSRwVPkDpEdB5Us0kMxpuxKa9MPpMgtc5ePq587umAclyq3Z+9tiPOAQ+6XAOs=@vger.kernel.org, AJvYcCWJcwZgcpSetDLs+yFfVFjVD0ZDtV4yyditiqkiZm3ecwbUQ+FfggYMI3bB4U77wzdsHTaN+0DP8UKtPoQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkdPdOOUUPxbRVbVo7teQuWUyOzQlNtbVCVstuw4Q74Cb0iWqC
	Hkp6dFTtKJRZxnQEryRHltsRyN7sIFAGCxdq2rlTwJoxV626HJtXM9h7DAMvtRS2rjP5/Dehqdb
	2E5j2WNLQ2rQBKWXiaAMFN4+F3iFZFEs=
X-Gm-Gg: ASbGncvdgnt9yCG3nbgmDxw5sfXIEZm4530WufI+v6WnjfzcvFj/QvhDsDaUglhMyxp
	XjUVXj8VRvJkFgE9UAnsCdkd6M38w4wcar6Muyj3gyaoLqg8jHrPaR0wx3WScmaKO8CoqoeaaOt
	ytmwT4wyZ+kCNiyDGCUUFGrU+9HBT3rhOexWXf1NszSqUvCa+wO7ozP+j59FDQSlc=
X-Google-Smtp-Source: AGHT+IE1hcIMK7m1GKoGJB24P7DGefofaI/Vg8OKATdfKWNBjeH6OMyp4e7LeetXAmTIp+kezDsWsaZdJxJ8WU97Ous=
X-Received: by 2002:a2e:a9ab:0:b0:327:fec0:b85d with SMTP id
 38308e7fff4ca-3295b9e5920mr57437991fa.21.1748430467655; Wed, 28 May 2025
 04:07:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412-virtio-media-v3-1-97dc94c18398@gmail.com>
 <20250526141316.7e907032@foz.lan> <20250527102111-mutt-send-email-mst@kernel.org>
 <20250527163927.02924adc@sal.lan> <20250527110444-mutt-send-email-mst@kernel.org>
In-Reply-To: <20250527110444-mutt-send-email-mst@kernel.org>
From: Alexandre Courbot <gnurou@gmail.com>
Date: Wed, 28 May 2025 20:07:34 +0900
X-Gm-Features: AX0GCFt5INry7hbLxnLIuUw8ffHrRUe_PZb75vuWFFXrALkR7hnpqJJcOCl5zNg
Message-ID: <CAAVeFuJ-zbbUT3ss5rw-=Sx52aoLxf7BCLz9tPxcA2AY+PX+yQ@mail.gmail.com>
Subject: Re: [PATCH v3] media: add virtio-media driver
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Albert Esteve <aesteve@redhat.com>, 
	Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	gurchetansingh@google.com, daniel.almeida@collabora.com, adelva@google.com, 
	changyeon@google.com, nicolas.dufresne@collabora.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	virtualization@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Wed, May 28, 2025 at 12:06=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com=
> wrote:
>
> On Tue, May 27, 2025 at 04:39:27PM +0200, Mauro Carvalho Chehab wrote:
> > > It's up to you though.
> > > I can keep it in next for now, so it gets some coverage by
> > > tools scanning that tree.
> >
> > Sure, feel free to keep it on next if you prefer so. Just
> > please don't submit it upstream while we don't review and
> > properly test it.
>
> No prob. I just want to see it get reviewed and merged.
> My understanding is, it wasn't because maintainers were
> not Cc'd so that should be all ironed out now.
> Alexandre, do you want this in next for now or just drop it?

I think it doesn't hurt to give some exposure to this driver, if Mauro
is ok with it (and it eventually gets merged through the media tree).

