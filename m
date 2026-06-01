Return-Path: <linux-media+bounces-63199-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FvOBSMFHWodVAkAu9opvQ
	(envelope-from <linux-media+bounces-63199-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 06:05:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD436195FB
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 06:05:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 242C7301DBB6
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 04:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4A5B3168E1;
	Mon,  1 Jun 2026 04:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="adnRwpM1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD2A314D1A
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 04:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780286682; cv=pass; b=uz6mnt2GMoPJwMzVOtR01XwMeieZnWed3tlbm8baHxkQwNoDLZhmLMbaHoxeIpvIoenTxEZkCQdlbNbFMOR9ZU7zrBaM6T/M1lX7Nb4+AlIPy6ke17//7u/pBMSG7SW0hwRiBW0EMiOJgxH/ETTrqQg1fSCIFBXvS2Jt6llDT4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780286682; c=relaxed/simple;
	bh=d+IOczc0WBQJu6QrD96jBu5/i2DZKnQ1eUqCZos7BY8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=T7IUMKSWPZ/2lp25Re/i0nZIk550Yi0YlyE+U3WtffKbrgNmYS9VWoGRl13oHFztc2icchpKUisVyNDLrAwoaDLHtZrhZZxdjPXiJwJWa5x6v2VwOZvCFLU43aATxiwUdQPfZG3n3dKTS/FLq5iLFxoyP8RRD4SeMAzSwqMR3m4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=adnRwpM1; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-66049669d78so2454259d50.0
        for <linux-media@vger.kernel.org>; Sun, 31 May 2026 21:04:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780286680; cv=none;
        d=google.com; s=arc-20240605;
        b=Vg5d1XLLiUA0nstx52MPPEgTRrFwPP35Kp6qZsREAO9nLx8Mc6Iu7X4IHeReO2cr9e
         544Zvn/8qBAtUAKIaqChNLxazeqKw/iNrup5qR9F6TWdN+ZuMD7Itp1hCHq8ITn97EhX
         OsVpQc7qaaRat2US8OW+R5wN1tuEu83AQNFe6Uhf/EmeGak/RFjePV4EPHVFS8tX96AD
         zv8YKuYEFG9KwiLkijWTC4QtiSHjMajJziH1nLkrM0v04mA56i7nKoH4PPNsuEZDiB6F
         nXmZyFU7AYTNPdPWNWYr9g5GmdwtAcN7qUn7tA0UbJJg8QlzOcybZnkxMDvHERcLKPde
         D8tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=T8tI49lhG5Gagu+1Q8eINEYaUuBsvyEcd4JeQ7Soxj0=;
        fh=M6vQXak9pZK+kgbysaiooMjqqk1zTsRQ0ji+bslH3+s=;
        b=GpHd0nl/oKB60Rqorvt161vxAUarexbKPez+fMTQGGxq3HeduT8igNILssZfoBG02l
         FtUQqjXcI5Ru03aZ/H4tfjlakyya3Tp4u4LEjDpWN/eWPkMfxKWSl+v6RGbLfz+BDeEX
         SZSglrc3Z4xmpjvy/vyUE/r2T11kJeiP0o7g8Iq8xosE+ewPB4B08nsq7NX/8jtlQ/RF
         6HbJrzVv2RWjagMMBSmFZET13LnM+iwxkzhNKnEsC4YZ/OBcyTbrwK4y5LVREqBwu568
         7gj5qWy0h6lzlIZ4gnQ5S5MYwTY4+dn4ukkAyDVJFSdI9Ox8uF8JpiVnbmHX7eq9xUUo
         8bwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780286680; x=1780891480; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=T8tI49lhG5Gagu+1Q8eINEYaUuBsvyEcd4JeQ7Soxj0=;
        b=adnRwpM1qXYhQbNoX8usu6BECNresT64N2iT1XHb9mDkOToJeZIxnqdO4OvZjMa4Xv
         8dzsJ4RD0x36uY7rbAzGsyf+C2ofs/icV+hkBDNuXtGEGDasymDwWr3rj2fFqgrqKDrP
         8KnWtPnd8mZUp3d60mVg6DMh2HRfQpOQGIjuW3HVyjx6fQOhUzWCcMghHz8ewTM2qIXl
         I4GV4+IinfuZnK5JZ5JLRcyQKi3OMWbrQiSwr+6ZkbTW4Wtns797BwQcdHH2OZU/Cll1
         ffdSfPhtEXP1G9ojG5XA/vfMpa4wt4UH822oVC9Y18wCdGB0C0KKjewH5Ki0ymDRMvBT
         NXJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780286680; x=1780891480;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T8tI49lhG5Gagu+1Q8eINEYaUuBsvyEcd4JeQ7Soxj0=;
        b=jHCLfGvdQoO5jgf4OCDojSdr0tX0MJB8Evj8pCymLNFDRYjdGN4Iqt7++JyV3et4Us
         Z9IaWOi5pnBZBXVcpHkUFk0dn5Ytxq5SsnmXY9uGH4/dnBSPOMrlWaoRM+dIweiUCoyp
         UYlrXnnwfAovrl2YlaQ2jr022sJ/wNOralelnVB6EfM9+m07CboxPcKemcTSsbbS2ZoE
         fSWDR8U7mBtYq7B16cTgXDAzAIk0Uk7fF9/xqYnufTJNZ4S2vOjZn0/DDwekZDv3FyAv
         gXwE+DgVtbgEje4ePDjkZyBJizzOoQ/VYtTVKzJrM1WxAq8yQvhewdk/WQ0ELmI2edbA
         SrlQ==
X-Gm-Message-State: AOJu0YzXPmzZfDTHlygW4GPBjoOntukgEl366p7GbEzBkqJBIOfRzJh4
	H+oAHAwP2cqUiwJMapK602mW/in7VEm+CijOj/QefFGt1YMJX0cOXu3APaRgfySSMcIP+hBwvnc
	/BsVeOdTLBP/zg3eUbJM/LxT1cT+GAvK0b7m+
X-Gm-Gg: Acq92OGqbuVX7cSPefBb3tkm3IRIkhmBmgcsIKgXXemztbsEguFGKcXveHklL8E+Xss
	jzK8SFj0bQwVpWIdC01jn+7WYVK2nlkSN5TWj3QaMAmfmMdxBgWSmFGjW3veLu+Y8jdFbAR6Hbh
	q/DwMs1m/RZA+8Q/U1yAmZSrab/h5yJXo7GL1nzZumxiNXZ3cJIQfzvpf0WhZBHm7ng2MCdVCZK
	NMCBlXAimLjDdvh4l7rsu3JhKHOVVhQKFO3n5PTZ6yCkpz/z6sRXDnP4suWAuKxo9jTjj5y3Hmc
	ZldQUD095BpPn3k2sl+J
X-Received: by 2002:a05:690c:30e:b0:7cf:f14e:bf5a with SMTP id
 00721157ae682-7e059ea90d5mr86204887b3.20.1780286679911; Sun, 31 May 2026
 21:04:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Ginger <ginger.jzllee@gmail.com>
Date: Mon, 1 Jun 2026 12:04:28 +0800
X-Gm-Features: AVHnY4LqrOed7VjObkY9T-Aw6PDbqln6ldLsP89WN9eJoUGyC1kYX_cQZVPV6mU
Message-ID: <CAGp+u1a+iTp=B2bDLLfe1o=pHKpe0p+qW406A9KeMMuQ8nr-BA@mail.gmail.com>
Subject: [bug report] Potential order bug in 'drivers/media/rc/imon.c', mainly
 in 'imon_disconnect()'
To: sean@mess.org
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-63199-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gingerjzllee@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 7CD436195FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Dear Linux kernel maintainers,

My research-based static analyzer found a potential order bug within
the 'drivers/media/rc' subsystem, more specifically, in
'drivers/media/rc/imon.c'.

Potential concurrent triggering executions:
T0:
imon_disconnect
    --> usb_set_intfdata(interface, NULL); [t0]
    --> usb_deregister_dev(interface, &imon_vfd_class/imon_lcd_class);
         --> usb_minors[intf->minor] = NULL; [t2]
T1:
usb_open
   --> new_fops = fops_get(usb_minors[iminor(inode)]); [t1]
   --> err = file->f_op->open(inode, file);
       --> ...
       --> display_open
             --> ictx = usb_get_intfdata(interface); [t3]

In T0, the interface is nullified before its get deregistered. Thus,
it is possible for T1 to still get the usb dev and access it via the
interface, which, however, has already been nullified.
The concurrent buggy order is t0 -> t1 -> t2 -> t3.

Thank you for your time and consideration.

Sincerely,
Ginger

