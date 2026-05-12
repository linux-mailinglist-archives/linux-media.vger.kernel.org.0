Return-Path: <linux-media+bounces-61237-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFbYOIb0AmrpywEAu9opvQ
	(envelope-from <linux-media+bounces-61237-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 11:36:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6438951DD8A
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 11:36:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C104D30143FF
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 09:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A9264ADDB9;
	Tue, 12 May 2026 09:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h2CAUCIc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702ED4A3412
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 09:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778578234; cv=none; b=gb7SE4aGWbbzVL0cp6y2DT9OtNIetiPZ9565VuE3gtGHosm5vOw9HrnmZYaCY2bs+GUeVyajtPgh4n/Mrk6qI3icNgQPHZsdRF4Nj/2rdMPQ1tXxwDm6zH1vRLj/Odayce+lmlyKr/O1pF2kL+j74WYEUMLnlkJ/YK83VQ2whWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778578234; c=relaxed/simple;
	bh=9ZVEYWiJ8mfJhHSDmdYoWsnzgviWs338ieiJcp1NW8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mHefMnEFNAYg8ybmBXPl/tsNTeea9/SUrz8HXZuvDyEDm54c19XMXFEBLwYLuPCFIdb3QeqpK1uR3N5FXs7B4j5G2DSPFbGQmv79osvyQ6XWfFVJIhz8WECTue0JxljiCzP3w2aLwviczTuryPwJMwa3q4pDwiKsdhdZFpExuP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h2CAUCIc; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-bd1caeba6beso46384266b.3
        for <linux-media@vger.kernel.org>; Tue, 12 May 2026 02:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778578231; x=1779183031; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VGZAkcM+ym8AsbVGOAJ6+xeqYSrWcyKvdgdcKQ4eIYE=;
        b=h2CAUCIcRb1DusSV3M0DsVMKaSnFMzQWB6BN488Z0jBqWbmUCtiTejmJ++7kPmu9az
         GBKb0ygNhV2hiSnqxDsOYc4Z4bZoFQNS0sIGhGkJOhwnEXt056MHvrdx/cJoM0ub2HUN
         NOvpioQrJODvqUNhlzDTfCE7DGx/rnVg27HjOsNWBMVHOWkKkLp3exAhuEciaqbO6r9F
         qRqgLy8MESUqxlcORPoWtDDbcIV9/tbZe41qBYHOUhIsPqYoAtcBornYvNJbQBmrrmQa
         gyfnctFEo/U/XYK9lRLVL/m9QMQM7poAmGO/UeuMf4Zlfs09jO9HRptcF0fqlDrExe9g
         iAmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778578231; x=1779183031;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VGZAkcM+ym8AsbVGOAJ6+xeqYSrWcyKvdgdcKQ4eIYE=;
        b=JzYrO3dGqln4Zic3CvEbx2Ev8pWHyTS+bbET3tQlVZrh0df45Q7Mtz9otJ70mSiUwR
         g18Gl7W+D5TyeNwPEPah8+sLzrnlZxtr0erQSwx06vxVun5KTnIX+rxGWkhypqKIEfjT
         nsJQ72v5qFaJua8Kn6MoItMMz8t9w+PuqBxw0rUhl3qUKTRdk0FjbEGe9DplOeDidy+b
         fEU6rq93qB872QsNGT215RXhR9zfw2Q7JtWnBJvaOGbBYri/KKFumWSVvOgMEi61j79C
         rQys3Yarb+9mfreWfZOSD8i1o+Wq75rGrh5MizeClk60Ui+SHmrc0jo9YagMiiqt3JnO
         Fr2w==
X-Forwarded-Encrypted: i=1; AFNElJ9hFBR6jp2UoJwG8QoXCNPiU7aWpv4mkeS3aCo8YoQxT1V++UnpARxFFvad5gPErpoH+zFA7gG/l5yJlA==@vger.kernel.org
X-Gm-Message-State: AOJu0YztCAQh8Yd40e4XkS7MbihMv5Eb8t3hIwRBTP6EXkKs5Ki3BIoO
	jfjTtNC4cE437ToclRJtLh0t04IbX99gR3b3r/cT3Sln6BNjy0YwtPlJBbODvg==
X-Gm-Gg: Acq92OFWF1M6fvUSKAkYaMheeblzKl6cgvXdYdSDBEUwcdyNsY/1KJuDrSd2bLuY/Jy
	7LYyLNi5dsID5L4DmcrOXAPzeJ9B7fwdqPC/q6uJRu3AMKIcInhulevExRTS8nO8TQzxNX8uhwK
	4o6PUOX3h58nFkV0vhS4RFd2kvCIYjiWSIqQkOuZhGFeDiPuoWYNfvVpaPEp5XDEPSrrfe5MKiF
	0zguLsLnsUxJMEJPMNEuw1wi1p587wwMcviJHCSxMTLJzJWda8JpVvhnvcQsuCzoZv5+FavePQg
	UYz99xl9uSfmcqTW5rTAQ3zNS/HZUQ7U/Uzk2sZEPLx7ynlMWpBFi20izhsuI+1uBWVbiRbiaOl
	JdHMZfOcbAGE3wXX/kJCTX7lRUgqX2jPT1sq95RRgIt9qS5THpAGg1EBc3xH3gEcOlshVud78zn
	Wmw1YCoRUf6rx6umUkqZqzO9SUhP3GOFtDoDYbKj4XIvf4OzNzNc757ajMKTc1/Jl3n6DvL1B0G
	WDBDhMNg5LfqnDPk3rd+Ef8M/FL539RlsGpDIbqjih9sUOZmw==
X-Received: by 2002:a17:906:99c3:b0:bc4:f3ef:e43c with SMTP id a640c23a62f3a-bcaad52246cmr973369766b.45.1778578230560;
        Tue, 12 May 2026 02:30:30 -0700 (PDT)
Received: from ?IPV6:2620:10d:c096:325::372? ([2620:10d:c092:600::1:8c90])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcfb7b17d1fsm303492866b.41.2026.05.12.02.30.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 02:30:30 -0700 (PDT)
Message-ID: <a4748a29-8aa1-44c1-a1e4-b82f4f191d4a@gmail.com>
Date: Tue, 12 May 2026 10:30:27 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/10] Add dmabuf read/write via io_uring
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Keith Busch <kbusch@kernel.org>,
 Sagi Grimberg <sagi@grimberg.me>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 io-uring@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Nitesh Shetty <nj.shetty@samsung.com>, Kanchan Joshi <joshi.k@samsung.com>,
 Anuj Gupta <anuj20.g@samsung.com>, Tushar Gohad <tushar.gohad@intel.com>,
 William Power <william.power@intel.com>, Phil Cayton
 <phil.cayton@intel.com>, Jason Gunthorpe <jgg@nvidia.com>
References: <cover.1777475843.git.asml.silence@gmail.com>
 <20260512070045.GA32030@lst.de>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20260512070045.GA32030@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 6438951DD8A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61237-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[asmlsilence@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 5/12/26 08:00, Christoph Hellwig wrote:
> What tree is this against?  I can't apply it against the usual
> candidates, even accounting for the time lag in getting to it.

It should've been a Jens' for-next

> Can you provide a git tree?

git: https://github.com/isilence/linux.git rw-dmabuf-v4
url: https://github.com/isilence/linux/tree/rw-dmabuf-v4

It's a wip branch, for now it's just v3 + 2 fixes.

-- 
Pavel Begunkov


