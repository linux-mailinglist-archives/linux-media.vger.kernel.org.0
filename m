Return-Path: <linux-media+bounces-33478-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E22CCAC5196
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 17:06:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7B85E7ADF69
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 15:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DB1327A445;
	Tue, 27 May 2025 15:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="erkcgR94"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3023A126C02
	for <linux-media@vger.kernel.org>; Tue, 27 May 2025 15:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748358393; cv=none; b=mzBvnIbgeKd4oo5IykpY42aipUlZpPX1/71wM0PqguHqKYY5ZKIQKRH1HPDJ8DtGBUIbEsMx008SV+2SApR7+mTkHQpVsSytmOpbiInWq1UA3DzrEL6g/5dzdXdwQGGqk2kg9GLgwjsN/HMh5Nm7Z9dwWDRVMykD3SBTlDM4Wlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748358393; c=relaxed/simple;
	bh=OeMg/n4s+XUyV+zOygmzjEvKMcK4qz4amGuZH9Z+N+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N8POQacDXNfcBVyEtXqHxOLItPJnu5Ula5zrkItuuEAb5MHFqB6UjHUk6zcw0+sS/oOR6x/az4Rka3QGRJKbGLCX/kjEw7IgXR2MQ8ZInMnYQno6WtDl116YUvLcAdHVvlNBsr3pDJ3LkP5tIvMCx2XIHZhdVke+4wY9nqTUqt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=erkcgR94; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748358390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XZ29RQMR69m4K9xLY43phEvDycHRnJ7kzp42BGznxp0=;
	b=erkcgR94j+n1GRaGfxd+TrzE6ucnxJrRKb1FH2wHFIAfmOFJQEZ+TKp8vdjTTOt31NLUts
	ChS5GAIyG8LvnyIsd+nl5RyvAVtkA3cdSHjYYh/UkMF3aVBDSlqRzDMhCURMxfRVf315WC
	NRipkKCh45TDidgioHQIM2h1hjkLmcg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-368-pD0BlcY3PwqjWs8PFNxgrQ-1; Tue, 27 May 2025 11:06:29 -0400
X-MC-Unique: pD0BlcY3PwqjWs8PFNxgrQ-1
X-Mimecast-MFC-AGG-ID: pD0BlcY3PwqjWs8PFNxgrQ_1748358388
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4d6453521so1267966f8f.1
        for <linux-media@vger.kernel.org>; Tue, 27 May 2025 08:06:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748358388; x=1748963188;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZ29RQMR69m4K9xLY43phEvDycHRnJ7kzp42BGznxp0=;
        b=dmFsfoymVAQ5/3SM1+ZeGpwJVf/4FR/5nCgdBjmdFKnoYaVYBC2WZb3mAMouKxHwQF
         7x9hcMd098ecWCs+gBsY7ta6/U+1SMGRPN4HJTyZUMpU2ZqxTN4ZkoAF+ahWYyO8F197
         SYYlz6FWSC3MfUe40UmDvrvBvjfUenCAtRSO/9x7CYS0O2zsKkO/2ZFv34otPa/xh3tt
         aS3g+IAo0/XFeUIBuqz3eRoJRYV/vnFkdDnc8M9/PpY0cLqmdYKqJy179bKeLDkOQcmS
         Qole1oWk7DUbgYfOuIUhcRTX7blYsW2chQM9DCgjzurngGNKezbnJAviXoLtM5m5JNm1
         3BpA==
X-Forwarded-Encrypted: i=1; AJvYcCXeR1otsjsWSsJL6pxldHk1Altb6KvUSc1NAQjrExzexUPd+wkRE/0ooZ8b4iXzmGtMuWGaFXzhJ8WJvg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4hspvhrzLPwUuCoJcI4MIhvr0Kx6m61OEjPyR40NvilUy85yl
	jl+5I00BohnmQPdJON1kgCRAJtxmv3wP1ZWiBqgYl3JrhRCrxasaHh0zlT5u1nE2fWJYSQtE9Nj
	NARB77JCDrmS/a47zgUB6TVPPceoTdYg/XDlAcPZnBV5is3ZukuIsllgKEIzkP6Iu
X-Gm-Gg: ASbGnctSIkkAYvqzA1BCEiGVuutxhXHdBz3PHR9O8e5Xlsdy8ExeGDyU0TITAkSREAt
	Pf/ljRezfC5AoxygYSA4FBK8Fbxogk4d6oQcCaEsuxIAc7IY0SkBTCn4l8BqW8FOr2yXJSKRueV
	2SS8zVmQzWNztfp3UtcuWjgorG2ZG817OfJI2gw616cRzyoYj5mHZ0d5NwT0hBcTwMXIaLMDXzl
	PLqMelch3r48FDK+h8lVJiPm7cATdYzZOIk/PFOaZ3zczgKYqmVe6++t0ch6EPj/Q7fldAOA9Bf
	ZkTOIQ==
X-Received: by 2002:a05:6000:2890:b0:3a4:d7ba:940f with SMTP id ffacd0b85a97d-3a4d7ba9678mr6493695f8f.8.1748358387820;
        Tue, 27 May 2025 08:06:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnxRACmfRB0RLkxdi7utBGmJ2uHTW6WSbB3UldnlI9CQBfujtwCkHpHjFnwqjC0VngKmP3KQ==
X-Received: by 2002:a05:6000:2890:b0:3a4:d7ba:940f with SMTP id ffacd0b85a97d-3a4d7ba9678mr6493637f8f.8.1748358387264;
        Tue, 27 May 2025 08:06:27 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4e1632825sm2396185f8f.43.2025.05.27.08.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 08:06:26 -0700 (PDT)
Date: Tue, 27 May 2025 11:06:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Albert Esteve <aesteve@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	gurchetansingh@google.com, daniel.almeida@collabora.com,
	adelva@google.com, changyeon@google.com,
	nicolas.dufresne@collabora.com, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, virtualization@lists.linux.dev,
	Alexandre Courbot <acourbot@google.com>
Subject: Re: [PATCH v3] media: add virtio-media driver
Message-ID: <20250527110444-mutt-send-email-mst@kernel.org>
References: <20250412-virtio-media-v3-1-97dc94c18398@gmail.com>
 <20250526141316.7e907032@foz.lan>
 <20250527102111-mutt-send-email-mst@kernel.org>
 <20250527163927.02924adc@sal.lan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527163927.02924adc@sal.lan>

On Tue, May 27, 2025 at 04:39:27PM +0200, Mauro Carvalho Chehab wrote:
> > It's up to you though.
> > I can keep it in next for now, so it gets some coverage by
> > tools scanning that tree.
> 
> Sure, feel free to keep it on next if you prefer so. Just
> please don't submit it upstream while we don't review and
> properly test it.

No prob. I just want to see it get reviewed and merged.
My understanding is, it wasn't because maintainers were
not Cc'd so that should be all ironed out now.
Alexandre, do you want this in next for now or just drop it?

-- 
MST


