Return-Path: <linux-media+bounces-61198-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDLtHKCLAmrbuAEAu9opvQ
	(envelope-from <linux-media+bounces-61198-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 04:08:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C41518B14
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 04:08:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2168A3020113
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 02:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 750403043DC;
	Tue, 12 May 2026 02:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JNl4YGN8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BDA2DC350
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 02:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778551692; cv=pass; b=GPERfqA2kuKPD9blcZJv/OEF5GPtmyc841qVkmYvo4xK1r/3BPvSaQgvU55ntO+66dN61qPcw5HXkEEpl4Kgi/b4Le3/Y6qHAMN3KRuVFewjh6nw8GNYtyBg1vjv5aXSYR3ua8whnaLZI/o/dQUtmnY5+rZrtIalbPNzxaH2pq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778551692; c=relaxed/simple;
	bh=tBWsdUmqpMA5QmxhdhkcdrvEGx/LMSt531O8iAp6EJg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SEceTPyYbEV9KDdR8qmaj82XqDiwIcKVIrjUjTa4gnFE9crr2jg5+7c2uE179l+Jht8B3/T/rSJnSP3RqfsnCKagIwx4vyTVtXWqs8dg0vtNrXDfj0yV2UTZH9YT/svVUr0aUF0d5WU3tp+RR1YKAbgX5MipI+4zWyqTqzupJ+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JNl4YGN8; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7bde9d73678so53251967b3.0
        for <linux-media@vger.kernel.org>; Mon, 11 May 2026 19:08:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778551690; cv=none;
        d=google.com; s=arc-20240605;
        b=eQjJl1nehJvJLQhy+n8gl4nh2SPiEMzgf73ufeuqL3Y11SBtrlm7HG8QuU902+q+hW
         2SwCRA818u7OIt46C11VX+lvVYkfCA4LEy9amsq21/kh/aD3VBxjEYTmwKkYVWFIyTTY
         fWiU6VAri6ID9uHakM635yAi9prQncBtEUtJRo98Vu3LZhfSuj3R1s/NivV7Ak15kj2H
         VyUPYxZFjsCY78msDeEw/L8jKCF8eZyfZL6IxyqmHuy5lorpUUNaN798Vf1+YS5mxUaT
         7Zrp7HwtnwjRktCYkHzwyrMTrUzXbP5E7iZM7xZhXSHygwjB53pdZSifSLzr1TvlbFvq
         JpJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=77FISKu6p2sK0Ty+tC1DOLiHarz8B8kEbkXuaAXpQYA=;
        fh=0PFL42crG9r7zEUn6gTEzJflZpof2ysTKW8jk3guosM=;
        b=faxo+gBP+d2IhOwcJMXwyBQluVhtKevas9tqcXwio8PCU4LI2EXXRZefDypcQVeCxy
         ER+Brys3ZF3fZ+5F9ClSIGCEHLW6gsLyblY426iLiAtwbLFQNHvqsP85WTCwdJQBRlb/
         d1uJaU+aVX+A38xobDuUpM1ubL41SxT9bPqJPhzrhWRXh0/mnsTFnVZzcSDPZ+4P2KQ+
         O8IJtDihhmtYTK9/mbc40pTtf6QWhqZA2T7s7tZdd5Qr2LaVLEFSXvBLAO1HTPMQaNTO
         goWr7CrQOAL+mcNcrtFVQsMpd8qtxodEEHMQDqLIMxCkP++hSBKqoyu149v/xgq6lCP0
         oE0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778551690; x=1779156490; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=77FISKu6p2sK0Ty+tC1DOLiHarz8B8kEbkXuaAXpQYA=;
        b=JNl4YGN80X36RcaN0icDRKssQUFqHbRH8ZAX77NrcjY8pClXvtKxomPGt1soz/xofv
         Esx/Vh5+iW9vfzEu0DoO6ugcyqxbmvPlMLSF1g1fcLcBnvfIOaNi1nC114JieTZ3atVE
         2pxYQ76rly9AXgnDFNdObzkhPmRK3qEuPs+ptKPTkUyCHxEP5UJce3yPr8Nfdu3hvtBE
         B4rHeeP6ZFBoF6JWqMllW0YdkcnWDm4KW4oEH9oy1JPhVVJPlGj4ttF1S1zDiYazYHS8
         qN6ij8En+FdQmgvMaWaUR3GGz01ycWDrZp21F9dmhAvdN9XmVQSud2l2/qdlsn0Xchiu
         wEDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778551690; x=1779156490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=77FISKu6p2sK0Ty+tC1DOLiHarz8B8kEbkXuaAXpQYA=;
        b=B3hxy4D0f9MKqH+6ifTU+n8WL/c6VoftZQXevbQOLvBpj8IcUqOoXs21rOmhPLRL2T
         BbINU2gkp/DmKb9D1ZIVR64rNpOZO7j3OvpsO56zkju1FHoPjRJatKovUjcviW6TtHT6
         hEdBX5D/h9zAdj11X7hL4h2A3iu1p/oihbk4SuBHQYIHnFfzQbFtQArR+AEfOjzSyI+X
         xoizq7CMBr5x6VSFI8awkDTRwI3nnm0VI3qAu03Mb9MbYxXHATZ7u7OJ+zYsnHlXiLgr
         hcoMZ0TzZwpSD9qxRknTAaR9ZTtJ0NabMyblyxU7m1UzhhX4HNIBUlIARvvZQQ0UNnLg
         ksOA==
X-Forwarded-Encrypted: i=1; AFNElJ/bDYllyKICSSuuUG4lLuipvrq/BPxfqJw27CYAth8yozG9Iak/m4q1bmimZZycXdHTT5EJy6x/k/wP9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTq3OR6nkuxvcLNDcNy3bbzfa88yCKFNh/XbjtyIHOYjmacDR5
	72BQG0WNNLnpRqEsIwY1NozonWuuIA4Y5Va72ywawECjoEe3dQ37xzGKHnekyfrGOP7n0MHHfXe
	VP77vtlJWN68ngXuW5xGNZLDYaOMjqZI=
X-Gm-Gg: Acq92OF/GYoOGLzesP9Jp1FPyoivjTK4ClfGiVqEmnVYatdyMhn4HBSzfMMtdamYdgb
	MkYtqpjfyk5LEkSEW874iph6hmyYbcR+W3CeZP0nm6VF3/LEw1iNlvw9JIpsNx+rUAN+/CWn2Ga
	0x2JoGEw2T3IYSD9vqRuZFBT7PAUGwknNcrbmh+u2RsifHVLRU14bm2/uxgMS9jZktQO4SXCtCx
	x8gsNAv8xs0H2gxmFV8+HXz9dlXfRLTJ31aQ/wL0EaVM+qAQ7crBSLO3t1BbHTQIEKxqRc2TSeL
	njU9Ood6cQSjGPXr0ykGLvv09WmMuzyV/JjddcGnL5e+bgmTin9C3sKPvwyyx7WFyNrGRkB8
X-Received: by 2002:a05:690c:22c4:b0:7bd:92fc:bffc with SMTP id
 00721157ae682-7c510b7019dmr17683127b3.28.1778551690519; Mon, 11 May 2026
 19:08:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260510053025.100224-1-kartikey406@gmail.com> <e1741cf2-3416-4464-bcae-741f0c87448b@collabora.com>
In-Reply-To: <e1741cf2-3416-4464-bcae-741f0c87448b@collabora.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Tue, 12 May 2026 07:37:59 +0530
X-Gm-Features: AVHnY4J2D1-C23A11f7UqzcVhKI94fEZIIYuSoxukd33EEp1xmrI8ysvEMqjWdI
Message-ID: <CADhLXY6wZfejdnGRKBy5raFE8U_VAivqx=oa+tmNAAOx-cSF9g@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: check virtio_gpu_array_lock_resv() return in
 cursor update
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: airlied@redhat.com, kraxel@redhat.com, gurchetansingh@chromium.org, 
	olvaffe@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, simona@ffwll.ch, sumit.semwal@linaro.org, 
	christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	syzbot+72bd3dd3a5d5f39a0271@syzkaller.appspotmail.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 25C41518B14
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61198-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[redhat.com,chromium.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,lists.linux.dev,vger.kernel.org,lists.linaro.org,syzkaller.appspotmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kartikey406@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,72bd3dd3a5d5f39a0271];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:email]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 2:41=E2=80=AFAM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>                        plane->state->crtc_w,
>
> Thanks for the patch. Atomic update shouldn't fail due to non-critical
> errors like on a signal interrupt. Could you please move this code that
> may fail in update() to .prepare/cleanup_fb() callbacks?
>
> --
> Best regards,
> Dmitry

Thanks for the feedback . I have sent patch v2.

Thanks

Deepanshu kartikey

