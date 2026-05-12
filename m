Return-Path: <linux-media+bounces-61238-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFLHD4L0AmrpywEAu9opvQ
	(envelope-from <linux-media+bounces-61238-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 11:36:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCC251DD7B
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 11:36:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DF18630CD7E1
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 09:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E30C14BC015;
	Tue, 12 May 2026 09:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WHcEIjXa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4F44ADD85
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 09:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778578241; cv=none; b=eBWFKMPLmRJDJpKUAxtTaPxlO50genlsFau21YFMVcSG5GvKwWWu0wkwElngl1BW5iiB6i+UuqI0tRoNKMNqXWevyidWBecnMfghELXzUD4CIBAGQMiBxb4z6HTqgLKZVea8/eoDfk9UWA+b+Zy5MPxpKhQNKVaCXjY9tdeoaBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778578241; c=relaxed/simple;
	bh=AmxHQti+Cn5C3pCrdSnBlqV6BaHV+iBm0oydG8MleKw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K+oBMdgL953teDw9ggAoir6fPDh9We10M9+y3N+spHlOv8PxpwPmdc/nxdzxplcYsWf9sYYWlY8QGzQ/uGEXjF9bARf2GLkZNp6IWToe+BkipGNofSYH+VSFiqX0jF8ShZkppAqILLj757yNxB4lVdB8bx8mR/5S5a03lUnX8tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WHcEIjXa; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-67c1e0229acso8135954a12.1
        for <linux-media@vger.kernel.org>; Tue, 12 May 2026 02:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778578238; x=1779183038; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1i6gK0r7rGWa5W/9WTpQ/H0vww/+AQmB17cNctDGbjU=;
        b=WHcEIjXadNkPFUtxZjibbIycxST9iPZAoiAmYMM+LukrN41+AEMZMMUijkA9iID3PE
         xg4pwXQf1Jf28htElNpnJC22niTXyfKF2ymcgg/R2KWT8wuJf7+q2BzapkmyoHtiZ9yp
         ZeXZ3dQBvv9XhLemLk6KoEUkaMeUy6581GgCbmz5Bl7y6+kbR3Wnh6/jD6M/cDn9kMfZ
         8AT9zIXP9OC7N3eldFmoe4xsIW/dvKGuw497uGm9lfr9q33CRajDdp+P2QckaO8WZZWu
         SK3l7wPIIMsdE2Ht4/8hyulcplC4t6peIu+13WnT+be/vVykhbBCd5Kgo5tQ7Kxl6IsG
         JtHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778578238; x=1779183038;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1i6gK0r7rGWa5W/9WTpQ/H0vww/+AQmB17cNctDGbjU=;
        b=CQjx64G/wlM0nwzwJBPwrFPyM98KFDu0wykmRXAtCTP0OpcomGgOzDBwqlGEd6yBDs
         CfCoNXOdbdxykhmSfYjXfgC/1y2hCo0gw79wNf17d4KwFyK0MtNappHsxTF/gv/t8h3P
         sdZlSv4eNRwRICUvUkI0H8OwCH/8k9ltiNXOs/NO/Yckzjz76/8sag4SB9hsSPwgWRwe
         Z6vWYpSRc1/PuaQ4Rt+Xs1RK7XJ0HO2NClVZpPLxK7PxjJJJL5Eb83DTHlS/KSFg5ZqA
         5mHYs+3qsqXD/0ZznJ8RhlPqUZmg4+G6Dq2lQnDg0c0TW7cgMPAw1O51DB/MAg8pdVgb
         RdCQ==
X-Forwarded-Encrypted: i=1; AFNElJ+LC+v7J2m5BjbDZth95rYlahXzqATK3UUNfjla2Q6oRtn86JiXlTzzVZs+yZoyObNPFHb6WSBe7KPPdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn3kvTM5P8hSKV9VQiu6NN4+XF0rItKx80r4urwyKAmYGJXwH2
	wb/dbRaoxq8e/ewDKq/FnmcPYpVfpDSj0NhmUCUuP5kzl45veUbsVJKM
X-Gm-Gg: Acq92OFNojI3pWg2kihkyB+ljjPPpi+KhIn9/c9AcR1k58YckymwaT0laC8UlA89lWh
	IWuBnN1MWFV4wHfKpZZZJwqivQaqbSRMrf3s+Om3dP1cQ1qXsGLWnGRK9d17xnNGyx+LcIeF039
	LuOx0UXGQe8BsIy3fsUC5lKjoV7kRXF9yq9XzJ1jYXmdd5UIGhaTkMFkqqYI5Tzn7wXHdXd6/mI
	V4fHbjkTVj55ipY0ny0VZ1BjagWgjEkHQaDg1jMq6u+305aEyxQ3IJf2wFmNIynDLayxdY7ASZy
	98OlKE5ioAMP2lZezVRm6Em5EFJvOI2XurvqmczMrmdzEBejygnhw1cimLv/WsJiBTDCJpRramm
	rTWls4EP+wfzv+ITuQl+DCRLZCDklUxu7lCrkFa1LychFQRT0ZGzdgpf7nsgyB63g3R/HdT/OcA
	dy8DfyD7pYJBJhjgG1UbWLVAOESZKKWjIqUSVgjNJ4QkTQ6w8rD9B2C52vMcgkarjTypwSvlWKy
	gyQl/3rXhIMSz+sDByrXFHAVFe8dx/9+ugpsnAK8bumzwA3kA==
X-Received: by 2002:a17:907:97d0:b0:bc2:1dab:3ea0 with SMTP id a640c23a62f3a-bd28de036d4mr114881866b.8.1778578237873;
        Tue, 12 May 2026 02:30:37 -0700 (PDT)
Received: from ?IPV6:2620:10d:c096:325::372? ([2620:10d:c092:600::1:8c90])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcfb7b17d1fsm303492866b.41.2026.05.12.02.30.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 02:30:37 -0700 (PDT)
Message-ID: <24cc68b2-c432-4623-92eb-b56b76850c35@gmail.com>
Date: Tue, 12 May 2026 10:30:34 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/10] Add dmabuf read/write via io_uring
To: Ming Lei <tom.leiming@gmail.com>
Cc: Jens Axboe <axboe@kernel.dk>, Keith Busch <kbusch@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
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
 <afi7c-VUJWOLlC1m@fedora> <6873d617-c904-45f3-bad9-e1ae39cfecd2@gmail.com>
 <afxgc4hizusnAA26@fedora>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <afxgc4hizusnAA26@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: ACCC251DD7B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61238-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[25];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[asmlsilence@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 5/7/26 10:50, Ming Lei wrote:
...
>>> BTW, inspired by this approach, I adds similar feature to ublk via UBLK_IO_F_SHMEM_ZC
>>> which can maintain long-term vfio dma mapping over registered user-place aligned buffer.
>>
>> Interesting, just too a glance, and it looks like what David Wei
>> was thinking to add to fuse, but IIUC he gave up exactly because the
>> client will need to cooperate and that could be troublesome.
> 
> Here the cooperation is minimized, maybe one shmem/hugetlb path, or memfd,
> and it is one optimization and opt-in, and fallback to normal path
> if application doesn't cooperate.

My point is that with widely enough adopted interface the user will be
able to opportunistically use it without knowledge about the file, i.e.
not knowing whether it's ublk or something else. But as you mentioned
below, it'd be cooperative interface in either case.
>> Should we try to push everything under the same interface instead of
>> keeping a ublk specific one? Again to the point that it requires
> 
> If generic interface can be figured out, it shouldn't be a big deal for
> ublk to switch to it, and the usage is simple actually.

Sure, you'd just need to maintain both as there is a mismatch between
interfaces.

> So far, ublk supports both FS and nvme block device.
> 
> And cooperation can't be avoided for this usage no matter if generic or
> driver specific implementation is taken, for both fuse & ublk.
-- 
Pavel Begunkov


