Return-Path: <linux-media+bounces-18340-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EA197B16C
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 16:31:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0D89281CAC
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 14:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 264F1168491;
	Tue, 17 Sep 2024 14:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="r8BZqzEt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E5C101EE
	for <linux-media@vger.kernel.org>; Tue, 17 Sep 2024 14:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726583457; cv=none; b=mmrYsDOs+cdtxW4t2mU4lh6EiuAf7K9p9upKCQOcyp0QVRuT72nvl50XYfuFVJ2E5cn93hnibS/naK7H+MiptkH5dWOx8lreZWdTWmT0wmZmgQH5iG5WxsYA5YY2ckFPJBAGQkIsYw6MkNQHf/nDOnBzGIgBreizrtH62YD6SsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726583457; c=relaxed/simple;
	bh=kIfGlOdakpQPz1iOfxWBoFSTSxvleeXHaLmfhx/JTd8=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YJLGVOaPVA8Cz5cn4vY4Y75FxftYF6Mibtv5roT3JqjlPGsTZLNc3HXzmW2GiLqkBQVQzllPJpK6jJtS5/pf6VQUT2tkOTVCKmsE3WW/wU4GSgUFygLMtEcCaP//gH8xRc2Xwp7T1PHhq3YgrEZt2kPlBDZw2+FPgox0mljqzwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=r8BZqzEt; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7a9a7bea3d8so459147385a.3
        for <linux-media@vger.kernel.org>; Tue, 17 Sep 2024 07:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1726583454; x=1727188254; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yMM89ZB/1bnrJFSfjunecThQPb2k/NYHbLvDy7SZXiQ=;
        b=r8BZqzEtGXqRArtqGvo+4IdonT2WrqxHMWHBWoLdB6BBzsnKNlIYNGp38y7t+lt9zM
         IKhICgPKmQvV+JZ1RM8tXYgp+/fWqLaBYqPsuSdtu9aBNXho+/5VM7xeX99NVXPEgP5v
         5Ie7ugnnFlJpAMri9MgvvUr6kaTQ6YdvVW+IP+sQxQ1mo495+OYcd1TgwOK2pYUKjy01
         sgpiOFSfOPTsoVl4ThQwmitRkH9EbqzEWHqbwAnwtJk6fX7L4zKl1783y8hqHpDJ2Y7w
         0NXef/10Bu9a/f7BCL2gJ9BPFsf5R8CAIyjCQC0YC2QrM0SCM6fGanC5oHSpQKeOO0kf
         IJ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726583454; x=1727188254;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yMM89ZB/1bnrJFSfjunecThQPb2k/NYHbLvDy7SZXiQ=;
        b=oLQV69ID3zGvbNgRE86u3dgPzKkp5tkbwYG1kpLd0iRbt1bkJElpz+z/E62RcvAHet
         vbG4fwQ/5h0eXPCNJbCr9h3F/5FU7yT7gjgosfbQ/XStb4shyilQsiRGVcA1f4qBNTNz
         9mY2P2vkym/AybUYpTaLEuJ15krDtPEBH7wZ+Hn+ph6lWldqT2/8DL4lYJikwJIj6o63
         VlbXUomXFair0YRkwuVRDw1Y3uyn2mnuhkpGhdu6m2dho3l10zo+IpNHwfYgYuCaIBdg
         aTeCSJ9EVXsfPNLqwLb2tvyUPJJvMCFx7M8m7vTnKdnYkji+JnpE3fOGO2qYoxi9Y7PG
         yG/A==
X-Forwarded-Encrypted: i=1; AJvYcCUGuPMAAa3Y771xbafFjP2OzSS5NmXkaNDz2p+cktxyWV0iI1qbXPzTw8m6LCo2JcYxNUwN+36EVNwiMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyDNY5GBxSWRe26QMogvObidFFXoN1QOwZ+0VbfLHBFME7QGUT
	7rqyO1lprfkcN7Lj2EH7MjwlKP05VWnKbSrBpCD4KCWauWFS9/zJkDspTJv4yEk0iSvnkDaQp8R
	T
X-Google-Smtp-Source: AGHT+IFuWpiPqswEiMK4f91GlBUHLcxy6MBTuW0yOxRV4vS+sFwcpn9cidx38Ymk5ez2HHX6RtiWJQ==
X-Received: by 2002:a05:620a:2907:b0:7a6:674d:a32c with SMTP id af79cd13be357-7a9e5ee7cd0mr2990491285a.10.1726583454536;
        Tue, 17 Sep 2024 07:30:54 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:17:9cac::580])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ab3eb57890sm360529585a.88.2024.09.17.07.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 07:30:54 -0700 (PDT)
Message-ID: <7a8e87d0acea6694e3a230472c942c6f5737bd3e.camel@ndufresne.ca>
Subject: Re: Media Requests on Video Capture Device
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Karthik Poduval <karthik.poduval@gmail.com>, Linux Media Mailing List
	 <linux-media@vger.kernel.org>
Date: Tue, 17 Sep 2024 10:30:53 -0400
In-Reply-To: <CAFP0Ok-pjOYpRxj8TbSgFgdQ6xT-pegd0b9uiM8LDhmu_WvZMw@mail.gmail.com>
References: 
	<CAFP0Ok-pjOYpRxj8TbSgFgdQ6xT-pegd0b9uiM8LDhmu_WvZMw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le lundi 16 septembre 2024 =C3=A0 20:42 -0700, Karthik Poduval a =C3=A9crit=
=C2=A0:
> Hi All,
>=20
> I was trying to implement media requests on a video capture device on
> kernel version 6.1. On my video capture device driver I configured the
> q settings as
> q->min_buffers_needed =3D 4;
> q->supports_requests =3D true;
>=20
> To make the application work however I had to comment out the
> following lines from videobuf2-core.c
>  /*
> * This combination is not allowed since a non-zero value of
> * q->min_queued_buffers can cause vb2_core_qbuf() to fail if
> * it has to call start_streaming(), and the Request API expects
> * that queueing a request (and thus queueing a buffer contained
> * in that request) will always succeed. There is no method of
> * propagating an error back to userspace.
> */
> //if (WARN_ON(q->supports_requests && q->min_queued_buffers))
> // return -EINVAL;
>=20
> Regular capture would not work without min_buffers_needed being set
> and requests wouldn't work without supports_requests being set.
>=20
> Does this mean that media requests are not supported on video capture dev=
ices ?
> Kindly advise on how to proceed.

Correct, some RFC for read-only request was adding some of the implementati=
on.

https://lore.kernel.org/linux-media/20210610113615.785359-1-hverkuil-cisco@=
xs4all.nl/

Now, this is about attaching control values that are apply when a buffer is
produced (more like what parameter was applied to that buffer). There is no=
 RFC
for actually applying a control for a specific capture. This is a bit
challenging, since we don't have spec that requires drivers to fill capture
buffers in the order they have been queued, even though this is what we do =
in
practice.

Nicolas

p.s. the dynamic arrays part has been split out and merged already


