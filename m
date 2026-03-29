Return-Path: <linux-media+bounces-57495-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id f7nTHdzRyGnprAUAu9opvQ
	(envelope-from <linux-media+bounces-57495-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 09:16:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5874350FFB
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 09:16:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07DAA301C596
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 07:16:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BD011C862D;
	Sun, 29 Mar 2026 07:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="quuSnCgT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB119221540
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 07:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774768591; cv=none; b=kKXXZmKj0kQRnpJNrB6CCfFK3jxHpyQZUUMaiGMXoCAldisV21iEfWNQosgqb/WDDYFGD6eqT0f0hWdX3v9HgFn/AroAtaTfK0/XYjiTq2dOPnn3bissQKmYmq5J9EZ8y2EIRThUkcFQT1RvNWDmsJTL/uqucUm9Dww+JnThEYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774768591; c=relaxed/simple;
	bh=1NxKiVQ1TIIQfXxJZ2jTSHxmlOFYe8yRaFFPpJwK6WA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=koQFkjAKKpPjiIVR61TEy6T55Q3JVZTWvto1dNl1pJJfauK4eYDseB/nK0v1azBJg8lI3aEen3ljbFKpBegfXFkvnmqWYhbkPO2wdMYXyTiZ2V/qAQazGYNzulQH4rziuvqKgSI/0VV23ASKhCRV7leedp/RYgR0vmlFD4Ysjxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=quuSnCgT; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5ffdd9a6155so4176849137.1
        for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 00:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774768590; x=1775373390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1NxKiVQ1TIIQfXxJZ2jTSHxmlOFYe8yRaFFPpJwK6WA=;
        b=quuSnCgTQxpgXJUmkoPRVFh0W4p9pNvYhJAAtOX1lYW5bJMKEaWyoFEZjh+MdQ7f6T
         xc0tbqsX/xXxPfq3xvONcdakpDWhDY3s456wWJeurvk83CS8KxumrleUI4PclYv3fV2R
         BzLGSGUsY/3KVf6yslBTyHumDKwnaZI88lOBe8v+2uFtqDb5p7+MsVnQQCv5JswfQjtu
         EYrz/xu7EBYWgvw++IvqMElwi50FmaBgGizD9hihb+fHHKV5SVazFO9HQth50GWY4bCP
         kX45D+D/T710RsqQPc7tjHAz8RoU608dnoN72wK1bn6oFiNoOX3udxNs/MKRCfm47STy
         eH/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774768590; x=1775373390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1NxKiVQ1TIIQfXxJZ2jTSHxmlOFYe8yRaFFPpJwK6WA=;
        b=gv5T83hUWC6fnwKiT/pHgdWa1Gqtw3ukIyVqr5HI1IkgyRGHdJM4gGn4vb2u6uG/Y2
         C8iQqulrkHn9Sle6NNXwQyVVOnRTqZq+v0AOB5vaJ2ychjXJZ1UUQYNgam1eMyMC8z6m
         gUpQ+Wfzhtz7DKfGFdLL8DYVZvHHOfXyG9pAPujbq/3blGINnZUCO8KI/PVqs2+saOjI
         UZROczQDV+5LqIEs9d4tOPbxOkTbiHDggYHYy8gHt4kmguonDTvPe8wXS1QFLrVBzAWG
         VtTUdUtlej2W3/jTLIkksdr8jakmXCzJHZU7NC35FdZjQYpy9iOhu0rASbx9rJpcZHyJ
         QAlA==
X-Forwarded-Encrypted: i=1; AJvYcCXiQRFTB1esgVDFgLAZ0pfKgXXtPHSaJhCtwRfIHufBfGryIe9FxJ60VBERqb9a3l83ifgZKKEa+LKEhA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj9IigSKMAbcvOe0CGacevrccI/Yulb+D+CXiAfKesJePmD4RY
	HOM6gek5zjekUNpCoBzv9dPvz35Y7El+35mOp2Z/JdVwvJu8vc8zjsGp
X-Gm-Gg: ATEYQzz1hfYKsQkBQflNuVa+vMG2Uv4R0NpWLgYsWcMb2QkxcgHI26J1E8jiFBq6pAT
	2+/IqyXUOJTRkSEi7V0TzB5+Ttrp1jFAuM35G/KOXBkm4Bu+Mm0tCuVtzRIYVq03OP3MtIJlkEu
	5F9JdUhRtEsASxerU7TcIb4ikuHHiB5FY+bRJvM++o4O2VtisnoQHNrr1yiVzWQS6UEv+oLEDIF
	KSBfGEK6OADC3Sd9f+tFlzWN9FUyJEfSRTE4JPTd//EfiO6Frr0q/W14lOaHF5iw3ToLOhiPNwY
	uttxkqDcjHq1tiAUraZ5tkijvzxut115atfkKNq7XcvucSKSEDEyT98FkQjVidQp4lPGKNuzYsu
	iUbf+YlKcyScGeOk7l0zfuvqmrlo9t+SKBNx9bzME7Ex3S+QfUP7OBGX2pv5zvDDDZSzPLv7eCh
	Iwmr3Q+q7KZy6w0xe7VlEhszPD
X-Received: by 2002:a05:6102:f95:b0:600:d0f:bacf with SMTP id ada2fe7eead31-604e4d73ea0mr3937751137.11.1774768589747;
        Sun, 29 Mar 2026 00:16:29 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac6:d6df:aa::11:19a])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60512a5afa9sm4390638137.6.2026.03.29.00.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 00:16:29 -0700 (PDT)
From: Sebastian Josue Alba Vives <sebasjosue84@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	=?UTF-8?q?Sebasti=C3=A1n=20Alba=20Vives?= <sebasjosue84@gmail.com>
Subject: [PATCH v2 0/4] staging: vc04_services: vchiq-mmal: fix multiple memory safety issues 
Date: Sun, 29 Mar 2026 01:15:38 -0600
Message-ID: <20260329071616.507876-1-sebasjosue84@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260329062229.493430-1-sebasjosue84@gmail.com>
References: <20260329062229.493430-1-sebasjosue84@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	SUBJECT_ENDS_SPACES(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[broadcom.com,lists.linux.dev,lists.infradead.org,vger.kernel.org,raspberrypi.com,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57495-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sebasjosue84@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C5874350FFB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Changes since v1:
- Reframed patch 1 as hardening rather than security fix (Greg)
- Switched pr_err/pr_warn to ratelimited variants (Greg)
- Added Cc: stable to all patches (Greg)
- Note: dev_err() not used as this file has no struct device access

This series adds defensive bounds checks to the MMAL VCHIQ driver
which handles multimedia message passing between the ARM CPU and the
VideoCore GPU on all Raspberry Pi models.

Reported-by: Sebastián Alba Vives <sebasjosue84@gmail.com>


