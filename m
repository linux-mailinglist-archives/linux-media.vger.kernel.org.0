Return-Path: <linux-media+bounces-65403-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MI4sKd2EOWrVugcAu9opvQ
	(envelope-from <linux-media+bounces-65403-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 20:54:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CE96B1E9D
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 20:54:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ZgHr7UeW;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65403-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-65403-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AA28E300EEB2
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 18:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 108B8346FC4;
	Mon, 22 Jun 2026 18:54:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6340F346E5E
	for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 18:54:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782154458; cv=none; b=YtnaxLhzbIO5V1q8iuxgeJ9fHuuPdSxVpUMOw/20xbnUciI4UIZ2vXxW+o8IWupJuGfVcoqtcVaZdDhVHm4hUulao4Rsz7quT/cYAjPVFaPHH/PaxRL210TYu5nsE6fIse9Mr+YHW/5h+v1xdcZKLWRLbohGRsifBz7JdDqAmLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782154458; c=relaxed/simple;
	bh=2yOz5L0ZojVJ+eTT0+yy0nBIwlc8g6T+QbFpZcblDx4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hcAXZwmcfKGn6DcxB87pjJKBs+K4V1JPJDEth4orObHMUh+h6r9xQJVwNbghPv2+hKE5PIQuZYuk0QneAX+nqs6axsfwjPx+ffMmj4v5SLHdvGs71iPQIoocgSD1mauE4ZfnDok7lD+wNn8gj5/dp4GnMcZiIsxYuxlyfVaEbco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZgHr7UeW; arc=none smtp.client-ip=209.85.128.43
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490ace40f4bso49238735e9.3
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 11:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782154456; x=1782759256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2yOz5L0ZojVJ+eTT0+yy0nBIwlc8g6T+QbFpZcblDx4=;
        b=ZgHr7UeWw2s/phrhR+7gJEdTpmDC0KVcZKIKvr0aEzVVyCI4QiHhlpvuav7ItMO0yY
         K7+2g0k7RTW1q0sZAXUJV/y058xHpGd4Z+JlxYMvzGRK8cy92Sd5gkwr2FsO1SRLJ10A
         EJW8WoYADOgbPuGer10sPFrJsJ3Ot1HItu8w8F74eNpzWdKLaEVfiGCqUoPCx/cozzlq
         pYieTztHqOvI/DsmKthzTyCow8w0soKA5aS8fD3AcjiL5gHEv/B62utONw6DUyxE9e5+
         JcmvI3GXPXY067FfNsGZ+29e8+lF5ip2G/Pd8I2UtbPtHm6kfhn66Frx07PstUGk2dIw
         3a0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782154456; x=1782759256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2yOz5L0ZojVJ+eTT0+yy0nBIwlc8g6T+QbFpZcblDx4=;
        b=ki4CFn2H+uUFovWlUhYtM58Z7O3shTpRnNQtS0McT5tu6FUeDTti/iveJ6T0R3BS6q
         fMgTHQ9VkI27hWP1KtU3r24v26G5xtNXiLtGdn+gVcvedfhIg6r9a58fagvb6cAdQ9aK
         ALoqCKGhGo2h7zJ1bCW+QcG5hAEtWC+wd0PK3Tdewa75kFfRPAjdTlIKY3DJaiC2JTtx
         sM+7POW8V/Z1Cl9yyXeJUgx0bHL9DlFKBw24bBhjTT9ypLZ9mkl5fLVNGUGnD9G1yLwA
         GrHlhnlGCg0v+YvScECJVJHRQMiEHAk5RwbvUttzBtidPVvZpsyZI/V8g/MqwkT4XT9B
         zLzA==
X-Forwarded-Encrypted: i=1; AFNElJ8hv+iTm+l69sMPGLJbYDQOyyLg0R9KJvVFbIlk/FpBaF7h9aRoi8Z1DaPHRSd0sbHwhCJP0Ftcyodkfg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwp6B24r6ryQFeV495rP052oYGdjDdbfXSflj0Wo6JZQq8XNo8
	3OyQekVbbCQ82HiyOUQ5Do0Um/LZ1f3Lbl+glfYclCA0uAf0m29MxTEB
X-Gm-Gg: AfdE7clFm/X9PqeFCq8QneW6xtzFqa50u3Y68POBpnMrGKij2DniqxZXgqGLaASYk0y
	LenD5snJ/74c46eUqBDxyvEgxEeTQMSITP7/HnxqlpVbu8NTiy1Bc5+WUHhfBLX3sfmJRxISoDh
	JSLHHghx6U7W9jFEFs9XUeWbaoNu36osGyCpjmMSHMjJlnM433mQKoRLA/Ul+Q7mDqjeX4DrUOi
	LakytjOWv4xoeFfpAJn4ZGkEkpJ+Kz8hi/5HHBxZiqFBYbr6kF53G/033a8tdRnlxWQa9j5WWFp
	Iu88LPNXkbtmoY9h17Bd0F3TCgUfaDxeTh20rkIgbvUJYRo+TR3cLFnJuKZWxdraGgZ9pC16WAS
	KSSt8bgu9wgbEW/CTuGzHKT9/5a+J4XInXENDaHb4elhGQWPZwTmai9LinFrX1Ydli6ndwsooZs
	c5A3lok4L7CfvMcAQSzG3HUYRbM0AFbQlxemK23NRSbGfFyKjZo+P96PCe7MoLlxzlEA==
X-Received: by 2002:a05:600c:3e87:b0:492:46c2:f5b4 with SMTP id 5b1f17b1804b1-49246c2f68fmr225200865e9.32.1782154455574;
        Mon, 22 Jun 2026 11:54:15 -0700 (PDT)
Received: from legion.localdomain ([92.44.171.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492492338dasm229097525e9.1.2026.06.22.11.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 11:54:15 -0700 (PDT)
From: Batu Ada Tutkun <batuadatutkun@gmail.com>
To: linux-staging@lists.linux.dev
Cc: hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	Batu Ada Tutkun <batuadatutkun@gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: fix indentation to use tabs instead of spaces
Date: Mon, 22 Jun 2026 21:54:10 +0300
Message-ID: <20260622185410.1336-1-batuadatutkun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260622184959.1668-1-batuadatutkun@gmail.com>
References: <20260622184959.1668-1-batuadatutkun@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-65403-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-staging@lists.linux.dev,m:hansg@kernel.org,m:gregkh@linuxfoundation.org,m:linux-media@vger.kernel.org,m:batuadatutkun@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[batuadatutkun@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[batuadatutkun@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 42CE96B1E9D

I missed Shirin Kaul's earlier patch [1] which already fixes sp.c as part
of a broader cleanup of hive_isp_css_common/host. Please disregard this patch.

[1] https://lore.kernel.org/linux-staging/20260505193015.49262-1-shirin.kaul11@gmail.com/

