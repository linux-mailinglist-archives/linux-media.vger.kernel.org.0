Return-Path: <linux-media+bounces-65251-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gX/3A5veNGrliwYAu9opvQ
	(envelope-from <linux-media+bounces-65251-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 08:15:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FCC6A4139
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 08:15:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=YAC3GBMg;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65251-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65251-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C847306E286
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 06:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16A61356778;
	Fri, 19 Jun 2026 06:14:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F6E34A3C9
	for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 06:14:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781849697; cv=none; b=Si8exo4a4k+uLVG8YVgcJtAvvKvU4xU7j2FE2u+usPbGa8yixu93XHict5Ntfup7XigtvB15jZyd97RZR7W3wRUVVeKFTSYhoXY3vi6XpfGrdGMbxokcBLlODVcPeZrdMmCAZWGOARlpXhhNQYaEQSrmPn8o/zVy3fzrJLaf/wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781849697; c=relaxed/simple;
	bh=+eBcaPW70wASDlXPZipUxXth6DqVuLjvRacZqS6CmMI=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=puYY1f/DLloyo4JD6/I1F4sVb1PLJZdsdWgBxO0mPCnJN/PIQRd4/TTZiZShKvlQ4yyD9YluAPOYupQ9FQUbkUwZC0lmCmHMz2cE5Hjr8Y8Y7vwAV4paptNu1l7CYV1AbUZEWg0DYw05ycuAuPll17J5S5FkAkU5+srJwenA2Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YAC3GBMg; arc=none smtp.client-ip=209.85.214.182
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2c6a97e1d1bso12816965ad.0
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 23:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781849696; x=1782454496; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rz+fbzTMbbQcunS6ng1B17yzmzwsLgl4sjliMALEa28=;
        b=YAC3GBMgP2NAT6jfr2nYMQLd26jV5ekmUtWVRJ1sub3z5LyCq/FPkNOQBbxw3FvzPD
         SGn7MtnjKtNYhchMp5uW41xcNvQenJ04UPK/yoKsplXz9+ytlBQT6oYy59t8uTElx9UQ
         ydB1BDpYVMH6rbNDsYY5Umr55oCHtT9n102fL9cM5eCidyVN31uYRvcRx4vmAhAGsqy2
         TQwYKsihts2kgiaZSbPztR4Tm4/rPCg4OsrocLAdoZFjOozLLR0Dz+1BtpbrBXfBRcXl
         o0hZ5UnTngSwXfIFBImOhDSCiVMAr2u12VaSwC5oHYPs9Im5QSVsEKpDkaYqOy2ZLuST
         pU2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781849696; x=1782454496;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rz+fbzTMbbQcunS6ng1B17yzmzwsLgl4sjliMALEa28=;
        b=bmF68zDHA66kb6y425Kz3cwsXIjPyB/fePDqKpjPXGS3TWJBvlVdjWmLSLPrF6iiN6
         MJfqykDsxZPaSW0ZjL6jsg2aQ3l71xMXEeXvIO1LYnqZGJIkT0r9m3cmJ3/Yg6rUEDoI
         nbtgT0UjsytgTlR8ckLfKwCV8U3veL7CmSOKi0qWNYmoAJpD3l25cyDUn2KRj9ree5li
         dNIvYbiipA1OBGeHiBwYseAKkf3fTx8IQDn/OglbrIft5l+dqeBD4HE6FI9jR/JWUsYQ
         i1zsqKnY1y53bG7/YnG9dE+ZeUhK3lLVT5e3Q3bYfic2omejF/DrHfeDEL5gzt7LCj+w
         kJNw==
X-Forwarded-Encrypted: i=1; AFNElJ8e1nxiY9af7uK4cJcBF3ASVAApowj2UbJYgMeZ6zON/ZNOHd1cJWyZ2Kqo7mbitMGuMCO3gQ6/QJj98Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyYj5JOZtGWT6lX7EablhD1szWMQOjj500TwWTfmTYQ148Uu24
	Zb9j3qvNTeXPhpLs1LM+hQsatiALtRI/EcsARsKUF3jULnaFXYhrOt9xRrxCvg==
X-Gm-Gg: AfdE7clKzWCmjTANOotNXk44IHkRcEWbBzt6mLgSc97Qv1Ea6dsFi47AApUa5xT/fy9
	DrVaw8I31SZjIoRe22c5MUBUoPZJRCPN4a1C9mK4ZA6Y0RLd5ogcYnGrMnd9QNSCVxhsAVb8S5I
	sKTH7eg4XLbwbo8Euxa4YyqxtwsT5TZXvy7qlk9BbAkcn7aM01uXK91lfg45IR2HxTfBNeQZ3zX
	mBsj6fmAGAONIa54S/etup8ziCqSwCNrZtBed3scLaOLDnxxlPGkPhSYC+IM7RqE7/u+4xkJt5J
	4DMEnZnLrNPZeBxK7JmDasEWDhguAwm7UaocFCyP2sq2nZHElcFLW4RBN28Ts6C+0CEnVU8l9G4
	veogEUoroLTgRsZWSE61Efh1jCezvhnuY21cg1VkKySAuHnph4OLblG/xONOdyQM7fF0b5PwqKE
	g2OM1B7f0MWKGaSFIUCMIBfPYPc5DkiE9hepHwlg==
X-Received: by 2002:a17:902:e5d0:b0:2b0:7d3d:756a with SMTP id d9443c01a7336-2c7190496demr25228815ad.35.1781849695726;
        Thu, 18 Jun 2026 23:14:55 -0700 (PDT)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7208e5760sm11188995ad.36.2026.06.18.23.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 23:14:55 -0700 (PDT)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Jasmin Jessich <jasmin@anw.at>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: media: cxd2099: possible heap overflow from a CAM length in read_data
Date: Fri, 19 Jun 2026 14:14:52 +0800
Message-ID: <178184969284.3970263.10559240541631708110@maoyixie.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65251-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[maoyixietju@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jasmin@anw.at,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maoyixietju@gmail.com,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,maoyixie.com:url,maoyixie.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 59FCC6A4139

Hi all,

I think read_data() in drivers/media/dvb-frontends/cxd2099.c can write past
ci->rbuf when the CAM reports a large length. I would appreciate it if you
could take a look.

read_data() builds a 16-bit length from two CAM registers.

	read_reg(ci, 0x0f, &msb);
	read_reg(ci, 0x10, &lsb);
	len = ((u16)msb << 8) | lsb;
	...
	if (len > ecount || len < 2) {
		/* read it anyway or cxd may hang */
		read_block(ci, 0x12, ci->rbuf, len);
		mutex_unlock(&ci->lock);
		return -EIO;
	}

len comes straight from the CAM and can be up to 65535. ci->rbuf is u8
rbuf[1028], and it is followed by u8 wbuf[1028], the last member of struct
cxd. On the drain branch the code reads len bytes into ci->rbuf with no check
against the buffer size. The caller passes an ecount of at most 512
(HOST_LINK_BUF_SIZE), so any len from 1029 to 65535 takes this branch. A len
over rbuf overruns into wbuf, and a len over rbuf plus wbuf runs off the end
of struct cxd, a heap out of bounds write of up to about 63KB.

read_block() itself only chunks the transfer by the I2C limit, it never
bounds against the destination size.

The sibling frontends clamp this same pattern. s5h1420, stb0899 and tda10071
all reject or clamp the length to the size of the destination before they
copy. The cxd2099 drain branch is the one place that missed it.

The path runs only when the driver is loaded with buffermode=1, which is not
the default, so the reach is narrow. Within that mode the length comes from
the CAM in the CI slot. A malfunctioning CAM that reports a bad length
triggers this just as a malicious one would. The ca poll thread reads from it
with no extra privilege.

I checked this two ways on 7.1-rc7. On the real driver, with a mock CAM, the
drain branch passes the full 65535 length to read_block, so the unbounded
length does reach the copy. The regmap layer buffers that read, so KASAN does
not splat on the live path. I also built a small harness that models the rbuf
and wbuf tail and runs the same copy. There a length of 65535 reports a slab
out of bounds write past the tail, and a length that fits stays inside.

The fix I tried clamps len to sizeof(ci->rbuf) before the drain read. The
FIFO still gets drained so the device does not hang, and the write stays in
bounds.

Does this look like a real bug to you? If it does I am happy to send a proper
patch with a Fixes tag pointing at 2748e76ddb29 ("media: staging: cxd2099:
Activate cxd2099 buffer mode").

Kaixuan Li and I found this together.

Thanks,
Maoyi
https://maoyixie.com/

