Return-Path: <linux-media+bounces-62310-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JW+MhjNDWrh3QUAu9opvQ
	(envelope-from <linux-media+bounces-62310-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 17:02:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4659859068A
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 17:02:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13CFB3164BBC
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64198365A13;
	Wed, 20 May 2026 14:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O2mMUdnH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA6F23392C
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 14:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288026; cv=none; b=OyWRtV7Y9w/ZRsYW5QhEmyN3zj3ZFapSTXYSVmWYH1kEnNbRgTqt385Pe4PTNzunj0lhtImofl0oNT0QEarXHlc50mtGbzKB1lnJO35hpN51mhB/LYPrEnHHnj8NnClqP36vPl3eXZvemVxehVoDf4aloLQlGu4xJaTdwFITYlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288026; c=relaxed/simple;
	bh=Z5a6VYgp4AzsTZqKEH+EQUvDERNLvmTuY5HgheWJxSM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=q8Gfx4lt6cmqBPGRGvx2nku/Q+WQSPJmV2ECU27gncLnSQ+Nnp8GnZWtAkECM/hsgXowrbtVFadpvf3safsldfEU9qiN7/P6paKh+D46qjkj8JhUD0ItHRFEr15W+F3WJXeeo9h2lQE4+DUDZnfam7Wp+2QoNfn4Lzb1vAsT7/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O2mMUdnH; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488d2079582so48174985e9.2
        for <linux-media@vger.kernel.org>; Wed, 20 May 2026 07:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779288024; x=1779892824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PGN2TPTujR4Xka4apJmaKEVpKRvu4thpccKwr1dUJ/k=;
        b=O2mMUdnHcOGk0FsmvTLk/1mRdbsHvCS/0BosPPie53iKE71zgJTGfWqY4LSAlV+CqA
         /Ky5eRPj28Gbx9oN3h2uX0cWD/oDxRcBRWbC4i11eiWg8h1/vvvYIDoZpXmP1m21muKU
         NrfaUNkrYLSrwHSzPYssNiJWENWOEM4+62Oi7xslGOfa3aqPapMvJo0Up+UDocLUc0o2
         kmX/CEDFt6xvmu9uy8//kjoFNSh2kG4iPSf96+Fm2VTmOuWzGJANoS2Q8hpzaRbMiaxm
         y5uvnXQrNk8kk7RejN33WOMbTmUAZFbXwwsLdtjZmhJXTSWXirUOybseAmAlNOSW71o6
         S6GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779288024; x=1779892824;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PGN2TPTujR4Xka4apJmaKEVpKRvu4thpccKwr1dUJ/k=;
        b=BmTzI1q3kEmHuPS0+ngxpTdET1FvbJCR3jJ7c1PePVSIQpePvQir0DjnDAXX2LY4Wc
         4fU9kRald4T8T9gHfqFiy2v4bx+LNol7ORei4Z1JCCASzYEeRPygBYbg8AEnzoy7n6UG
         BXH7euBZe6Kd6hB5g4wgu8HUzvl5NefuwJwYVrjYDnTHnnCWfO5FUD4yaGbzIQmkM+CL
         Wr2DJwgKhBMC2gI3CGtv9lOBKMntCQAuo2p8iORPoccGyCYMOjB3MHTCT4cUSkNsv3s+
         JJIeeqkMYM2wS7VxvOd4hl1C3rIOJMMBvTrslp+C/GrkqDQDJUDbKzKX9qkKoK5Cmu1Z
         9Qhw==
X-Gm-Message-State: AOJu0YwFu1fgKytmheTCx02JinkIS+WE1cum5iyjcuJRE8BkmGTrFPk3
	smfs2zzpPsE0njsZyKS0ZhItVVKOjrGwj1jyJBmDv62J7suICX36o/w=
X-Gm-Gg: Acq92OG3yktPhg3Sw1OpnxmBtUaAm/FFhwNWkGRGAjp8drCQL2NKlYC+yCtqFzFs1hH
	ZhcpWvOn+UneIG501iB0L0k8s35kJCfH/nr07rwwnvfsOe09hVGg/rhwq3BgxJ3LlCUNHux76c4
	fNfbk0UbTE2Y9Y0+nGYIFtaJ68E+nnQw7ypz+gTlmb/yV6pe1YPiMRI5ed61wl0iOG8SxAMYEky
	nT8VB39fbEGDQL2lUeaBCCUEKW7Lzh4LKAdudjjA13kqmgT4B3ZTp1Imt7agdDlLWdpkExQT4ws
	6du14/UF/uAakbR2DXmhFhke4cjEIozLcz2JkW76x0L7a9phEjveAgH8CHWlBu5QJRRehWMhsKo
	8fNlAxlGYUYQ0C/UA9+ia+BpnGxq6yVZkn0l9ZQqsObylZ5Y04lUO9sCqjbC35rYjNsL2b8jGsY
	mUWQ4T7YWBn/EPqoRfoGWyG7x5REUm1ntkjDWDMNZbB7fMVyBqTi+RsRVJ+s7xuwDyKpeJqnX5j
	vVzcbG09vhGsA==
X-Received: by 2002:a05:600c:858d:b0:48e:5990:96b1 with SMTP id 5b1f17b1804b1-48fe6514c62mr292743205e9.23.1779288023465;
        Wed, 20 May 2026 07:40:23 -0700 (PDT)
Received: from localhost.localdomain ([151.37.214.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fffb9aac4sm540283105e9.9.2026.05.20.07.40.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 20 May 2026 07:40:22 -0700 (PDT)
From: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: linux-media@vger.kernel.org,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Jonas Karlman <jonas@kwiboo.se>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [ANNOUNCE] libva-v4l2-request: RK3588 VDPU381 VP9 decode (fork)
Date: Wed, 20 May 2026 16:40:17 +0200
Message-ID: <20260520144017.69528-1-pavone.lawyer@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	FAKE_REPLY(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,bootlin.com,xs4all.nl,kwiboo.se,collabora.com,sntech.de];
	TAGGED_FROM(0.00)[bounces-62310-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pavonelawyer@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 4659859068A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Nicolas,

Thanks for the candid feedback — and for the heads-up that the
direction I picked is the dead end rather than the destination. That
saves me a lot of investment in a path you and the V4L2 community
already see as deprecated.

Two pointers would help me catch up:

1. The recent Chromium VP9 probabilities work for the V4L2 stateless
   path — could you share a commit, a Phabricator/Gerrit link, or a
   tracker ID? I would like to read it, test it on RK3588 RKVDEC2
   (VDPU381 / VDPU346), and see if it covers the same compressed
   header / interp_filter corner that the libva-v4l2-request fork was
   fixing. If there is something useful I can contribute back — test
   coverage, bug reports, follow-up patches — I would rather put the
   effort there than on the libva side.

2. Vulkan Video status. Is there a public roadmap or a working branch
   for the V4L2-backed Vulkan Video decoder you are pushing? I am
   especially interested in how request_fd / per-frame controls map
   into the Vulkan Video API, and whether ARM SoCs with stateless
   decoders are part of the early target set. If there is a place to
   follow the work or contribute, please point me to it.

I will keep the libva-v4l2-request fork running locally for the
ecosystem that still depends on it (mpv `--hwdec=vaapi-copy`, ffmpeg
CLI), but I will stop pushing it toward upstream now that the
direction is clear. The kernel-side fix that got VP9 working on
RKVDEC2 (the PM runtime teardown cleanup, lore link in the original
announce) is independent and stays useful for any of the userspace
paths above.

Thanks again,
Francesco

