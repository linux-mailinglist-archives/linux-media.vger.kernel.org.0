Return-Path: <linux-media+bounces-56626-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLlhFf91v2lo5AMAu9opvQ
	(envelope-from <linux-media+bounces-56626-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2026 05:54:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA682E83A9
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2026 05:54:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6300C3014970
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2026 04:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D226332909;
	Sun, 22 Mar 2026 04:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nZNrn4N8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CB128727D
	for <linux-media@vger.kernel.org>; Sun, 22 Mar 2026 04:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774155243; cv=none; b=bBBIuMvGv0f3ISvI8wrDp+hBorR6w/oU26dChrgIYsI+MyJ9YW+/4rkeQ1FE+SiE8cV+Nfw5/ogl2Wq9zt4OSKHDwCEvI0EKE9XtQNsy5VG+zfUu3oIjWanzyzo5RigxdH66c9MATqDjQXByVWqidmWLvidQfBkWq+ClSKYxjoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774155243; c=relaxed/simple;
	bh=4NO9JUJhyayWXRGH7TucTjOwS9UYDPyhXQDSeG2XibM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VHC6WLTUkvV6cXFOtm2tCaHk1Y/gpuwAvL93nx373/mxaEQzXcXPNJxe2atR/9sxqq/NkkIY7dfBsnkcSm4ilXfIXpUrAkP+E6yPos6UxGZXm7mliRxVtHSZEy7pPOgD25whh7ZCzVZaG3J05aHOTuXODW+rCcm8KxpbniqHbmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nZNrn4N8; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b97c44417ffso172184266b.2
        for <linux-media@vger.kernel.org>; Sat, 21 Mar 2026 21:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774155241; x=1774760041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rceXIYjkxGxkrV6mCBwPxwxWKyKTu91DLeOrWHZGrOQ=;
        b=nZNrn4N8GRWlH5KJICEUmAgZUc1+B/qUxslhAgsp/m/5UABEM1Gnld63W0RapXk+24
         qkVhn9CyppMkWGUmeePCgAPzvNUpbiAK00tBKq0fFP36qkZS+UX36S5p3OZuC2tLWQRe
         I03BIUXUMIJg5SSQ4np6EjEZHuGlpP7UJndNe0L1r5VFOAM/RM6kQG6UYNYkrs4wHp4g
         V2DfGrlhU5+RDGAbgHEQ8zVew4lvlvY1LVxSaqNaCexegR6nNu50GYV9+FnhgGkmjNp9
         i64TZ8DbEI6hLwopvaNalrWVZnxFRSOFf+EjJyK7BiSfR/dlvdO6N1CgUxamFzgi/oSM
         izqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774155241; x=1774760041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rceXIYjkxGxkrV6mCBwPxwxWKyKTu91DLeOrWHZGrOQ=;
        b=Y+KhA/zGl+LIbDmsrXM3sSDIpfuk0wxLv0cwi6jN1V2i26AtHWzt7IbdT/LB77Irtq
         isvbL/jY7outXi8cIeTU2hM1ggpl3b/sej67PTCS11HXCmReslrCABbhxfGJyc4vWW+V
         +gzgl3fslbOK0SkavJyDagk5xK2onuZQY39vormkD+lJQkvLPndVqqZuMLfLDpmA73IN
         o1YPil3ilfcWw8o0prm8KwBUDGRwBmGQVxIY9MvNhfIQJTuZxvEqLzqJko5EvULRW+WQ
         AhQlZMhnSLftPrMo7M2nxxdLsckecfyHWjP6O9ojj0OsiHQdGRNqc+9yxOI0TdItNlgJ
         EjKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYT5QfO0bJbI4iaF8V2FcJ3dECJwgCyHA9X66GfxvS6ceC9o2LcPb3gVvIox4yNE7+4eDD9FIxGw/5Zw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmilu45CghX2uvux/D0HQOFdsxQPS52TuvW/S+9SV/j+pid0ae
	diqUJQpZu438HOAGA3L2AJ8kcSUu7ULr7NLUBEdCkNyuyp+m/9xSTrF3
X-Gm-Gg: ATEYQzyVQ7fQ2jOTK09CoJ5PNoXFiQjGIFciT7+lkut4eL69wd5ujR7TCx8/2zlK4jD
	CVMqAvR70NmqTVBg51E8cQItkCJICEZZA5sqqIoWdnnWAlUyfmDSJVzzUKZWrlwCMTe/cC6CP5/
	33IwCLxv/QBNcNBRugmrFz2KRQ+KupbuZ8Gg60yqOeqvsggtojEq+o7BAs27fNrypJS+O4PBDut
	8wvp7ygjJbMPX3fNH6VTpTxnK9O78+OOxRRJHFmkr0+8qlXqXWqBnWpXNX+C2IgMJeKghfgo9IW
	/g5w/669rs7zvkW2kQ2E220ex99HL47meYH5/M6avyf2u3ZTKRkJqZbzJh4HhWZ3bZf5jMrK0v1
	AY2Sbf7vPtOaElFcDEwx2/lnhOAl9r12aCubDVcyRRAiBqphBLMzf9F0HhtjkhLvFDKQZb9ctN8
	91Q0+JtypUrwQi0mygvXq9EaI/KA0+iVICC9s=
X-Received: by 2002:a17:907:a807:b0:b96:d6cd:29e6 with SMTP id a640c23a62f3a-b982f0c00e5mr517986566b.2.1774155240526;
        Sat, 21 Mar 2026 21:54:00 -0700 (PDT)
Received: from foxbook (bfk214.neoplus.adsl.tpnet.pl. [83.28.48.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f43c3bsm333532066b.2.2026.03.21.21.53.58
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 21 Mar 2026 21:53:59 -0700 (PDT)
Date: Sun, 22 Mar 2026 05:53:54 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: JP Hein <jp@jphein.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede
 <hansg@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH 0/3] USB/UVC: Add quirks to prevent Razer Kiyo Pro xHCI
 cascade failure
Message-ID: <20260322055354.03399a32.michal.pecio@gmail.com>
In-Reply-To: <20260321223713.1219297-1-jp@jphein.com>
References: <20260321223713.1219297-1-jp@jphein.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-56626-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DFA682E83A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 21 Mar 2026 15:37:02 -0700, JP Hein wrote:
> This has been reported as Ubuntu Launchpad Bug #2061177 and affects
> multiple kernel versions (tested on 6.5.x through 6.8.x).

> Tested on:
>   - Kernel: 6.8.0-106-generic (Ubuntu 24.04)

How many of those problems still exist on current releases,
where hese patches would end up applied?

Does anyone have a repro?

How does it behave on non-Intel USB controllers?

Regards,
Michal

