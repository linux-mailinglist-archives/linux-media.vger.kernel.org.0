Return-Path: <linux-media+bounces-65084-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9unoJK1PMmrgyQUAu9opvQ
	(envelope-from <linux-media+bounces-65084-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 09:41:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FE26973CA
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 09:41:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=0sec.ai header.s=google header.b=UoXLsCoP;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65084-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65084-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 714B530164B2
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 07:41:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6FAC3BCD33;
	Wed, 17 Jun 2026 07:41:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A1F318B96
	for <linux-media@vger.kernel.org>; Wed, 17 Jun 2026 07:41:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781682089; cv=none; b=Y6TH07kjxTirsxvhQfc78+ibnm4U/uoj4oyHXD7bRle+dO36Bmb80ma2tIpSUVeWajMTkJeCsTKzYPgFbnZpzvLXxULTHXTtgP0zPVUvbUJytn3X95g6MDyYVtHldbxrj/9E8Y+k1SG4d4iaoe3/BsCIHaJ4DJuAAW1RqFFs4cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781682089; c=relaxed/simple;
	bh=VfvN2NB/wnjHyZfBZHt+ChcGGwIjmvnR6Eg88MC6Nvc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EOIDFxX4i04JxWKaFZXQd+rsGpmNkuaSQFDhhtxXAme5nYP/VcU9KBIBPs1wlPY3z+xuNUmEDKckOH1TUl7Q4QIGlz6TVtE7Ga286xzm2/+LU5K3o8iLWs+NEeaTS/gTBN+ZUW0DBj6HdqTP50mcMd/Xf4Dp3E3x4lAWrKqgRvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=UoXLsCoP; arc=none smtp.client-ip=209.85.221.51
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-45eeea039ebso3091627f8f.1
        for <linux-media@vger.kernel.org>; Wed, 17 Jun 2026 00:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1781682086; x=1782286886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JTKHX6NCn7vn/+gvhr4Pc1ts3vNTjwaHvcnrlwVBhzs=;
        b=UoXLsCoPLwtM/ZQdao4T6xnz+OtL3jt8kfU7NvD7O/Isk5OydbV1r2i4P7/2k7paZI
         oOG8r9nefFoRIN/jb3mt48lB9y4FNtTo4U1d3EEBz6AEKMoL2G53SxrpuCuNI16gWCUB
         /szNuC3/8aat2VA1KCj2k5W3E/lvs9PPzJv07A9dsSsZvukcU3j72hj2WUqG1yGwiSyC
         k9mkVhk1hwYa5TXLZo8Es6RiqTwLfH6HYZZIlSH1pna0T9w0wDwctiU+5inaXe6HeGVy
         S7bu7mWGEw3E88fWcbqdkvbI6pJKfHM80bz4OBTjrVN6vRCkKW7HOblLf95hTIolBYVb
         rxZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781682086; x=1782286886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JTKHX6NCn7vn/+gvhr4Pc1ts3vNTjwaHvcnrlwVBhzs=;
        b=rB96J79wVQJLIvPkZsPPmrpgygoX3t7PrkAMts0uCfAZPbCG0UgKwMGm3AuRRV6tbc
         1qaQGqu84BOSj8a1l3fT/XRVes6/mPad80hpLKlVvIpjRws1MRcZaKYvKKB6b2o3dqfV
         AuLTJwCBcm+yOF2QGerc1e062B2Pf3sdthihg+4JshhBd0YcLh4Insf+1uT7wZTxHITU
         ruPOOa0Jp6+qB87te5GQOY6GIJPxSs2SjI1aFbw+p1E6261XcHhxVgfEowQsB8/la//8
         Lsesis4IRaS0CfNJyn/V8rRibuv+rCdQeZOWdrBvAf1SgXVYLaN/r5RLJenlkTxZ6ddD
         fIeQ==
X-Forwarded-Encrypted: i=1; AFNElJ+f8mx1DEP4U3jM0LThfbm2oZiOzk6XB0qQTd2v3QU+MXmYdibk7hWlbDobFOqPpTzza+Oxz2hcpZP4oQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtwZe/sVdLHDl59tWJp258w9gmilZcUx8FSWCpcBWahFpynn+u
	Z9fVc0i+3jQVRHR93dX0P8Vge+5VwE7IF9rKbm9D3EdICi3rN3OAI08Y3xW8yXtDz5nj
X-Gm-Gg: AfdE7cl2VmNaRvRxzTVlMEY84qjh7j/VS+EGO3uZeoJaRN22kzToKeMtrXXPoTWS8cE
	cfGzyBmvgXXsij7N89UCCDETc3CSkl1Xf2tFdOzyAxUHMRMtMUkTbproYvUu1utGH9uPbqT9EOJ
	icNuOhf44H4nAg+98ju7Eo1DNo/a32IRANvOyS2I11Ga5YHU6HbLFdoMlshJF28aEhc5ZizLIIi
	hjQNKJ4oTEwIx1VMv2SZmVpEYX5uOgjGGBB4Uk09oaCOsdgfFcUWqwxIX3EgYcg0E/zAlFsLmlI
	0N4K2V7I2OZJgBeJ9uToiAzaL+YVgm5lE5x+J+/iMQ293NcTQ1MzINIolTG2SADneboM4V93htV
	OdhJfZ67FHGoNSsIf8yWesR9XYaK7h4yL4q7CK6kNqzX1YCgwIRTOWDS+gNIpGRExilk8APMrVN
	vYduztjcYhJz4VXIxbKWTwbbKnGhsTiF61lV/ekMyytv4RY9P3nJOdsG870gyrWwlcPeO+Ztkt6
	FF75Bea/vxIL3MbqWXauXQOVcSaZz7nYws=
X-Received: by 2002:a5d:6a87:0:b0:460:25f3:b25a with SMTP id ffacd0b85a97d-46238f980ccmr3573765f8f.34.1781682085876;
        Wed, 17 Jun 2026 00:41:25 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26434dsm52677098f8f.1.2026.06.17.00.41.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 17 Jun 2026 00:41:24 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: neil.armstrong@linaro.org
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	hverkuil@kernel.org,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>
Subject: Re: [PATCH v2] media: meson: vdec: fix use-after-free of decode work in stop/close path
Date: Wed, 17 Jun 2026 09:41:23 +0200
Message-ID: <20260617074123.32464-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260616074952.93076-1-doruk@0sec.ai>
References: <20260616074952.93076-1-doruk@0sec.ai>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[0sec.ai:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-65084-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[doruk@0sec.ai,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:hverkuil@kernel.org,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:linux-media@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:linux-staging@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:doruk@0sec.ai,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	DMARC_NA(0.00)[0sec.ai];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,baylibre.com,googlemail.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,0sec.ai];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[doruk@0sec.ai,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[0sec.ai:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,0sec.ai:dkim,0sec.ai:mid,0sec.ai:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F1FE26973CA

Please drop v1 and v2 -- both are wrong, and the sashiko review was right
about the deadlock.

The underlying bug is real: vdec_close() does kfree(sess) (and
v4l2_m2m_ctx_release() frees sess->m2m_ctx) without cancelling
sess->esparser_queue_work, whose worker dereferences sess->lock and
sess->m2m_ctx -> UAF if it is pending/running at teardown.

But cancelling on the streamoff/poweroff path can't work:

1) Deadlock. The worker takes sess->lock. For an m2m fh the ioctl core
   takes m2m_ctx->q_lock (== sess->lock) for VIDIOC_STREAMOFF and holds it
   across the handler, so vdec_stop_streaming() -> vdec_poweroff() already
   runs under sess->lock; cancel_work_sync() there waits on a worker blocked
   on that same lock.

2) Use-after-power-down. v2 also cancelled after vdec_ops->stop(), which
   power-gates VDEC1 (__vdec_1_stop()), while the worker still reads a VDEC1
   register (vdec_1_vififo_level() -> VLD_MEM_VIFIFO_LEVEL).

The only deadlock-free point I see is vdec_close() (the ->release fop, not
under sess->lock), cancelling before v4l2_m2m_ctx_release() -- but that
still leaves the threaded VDEC ISR (amvdec_dst_buf_done() ->
schedule_work()) able to re-arm the worker, and there are adjacent teardown
issues (esparser_isr() vs the dos_parser_clk disable;
vdec_decoder_cmd()/esparser_queue_eos() without sess->lock).

I don't have Meson hardware to validate a corrected fix. Is a
vdec_close()-only cancel (plus quiescing the VDEC IRQ outside sess->lock)
the direction you'd want, or would you rather take it given the HW testing
and the surrounding teardown concerns?

Doruk

