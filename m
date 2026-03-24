Return-Path: <linux-media+bounces-56783-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAqtES3vwWkgYAQAu9opvQ
	(envelope-from <linux-media+bounces-56783-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 02:55:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A270300C31
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 02:55:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0CC853037F3D
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 01:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECC4E37BE7B;
	Tue, 24 Mar 2026 01:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j4XLOaHu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B61A37B400
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 01:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774317350; cv=none; b=NS82MisAhf81m/9QCk7BlBfpUK5HcDe+07QFktKGSElY63C4PiEMguO433aDeODzsfpgyfLAA7lyiQUdt/bbOt0iT1rsDZkNNLjp+UARp8BgxtMHgmGRXmtrNcYUR3lDZtDgZj58znU2bsAFS0DhmjbL5RkvuFG2HPBtMkSAaXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774317350; c=relaxed/simple;
	bh=JAmtHZt+i8fAEau+uDnuiufAN/CVFZtpCZ5Dsp1wVvE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FWV7bMJJFMwRy0OvtQ3YBpgbt/Tj9hsDGECC4tDLj8hDlSlzKBWODcg7PPpFBMl2r0uQW8FA0ZDsaV5HQPuCbPf86M8+WT3Ra6NiK2U5SUo8dmgQfpCr+y6cGoPEfBp4kaYQaO5bVg8QQVb+HjRKuxKZn3Z4GHiTymo8l9sU1HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j4XLOaHu; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c73c990a96dso1390845a12.0
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 18:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774317346; x=1774922146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xLM6YKJgxLhPQDfQX2m4g/wult9s4kqFfxzN0AZd8EI=;
        b=j4XLOaHuhZ2iTswdI9GuXJ9IKVneqnM9QgyaYLvukmWdRwQJTM7uisKuy1sjEs4DlD
         P2Te6ClQiLOqIaIejfv67VTzB6Qgz018iat3DOljC1DU4QagGm2hq2ZAa65ka3Hrp69u
         FBh5FcmB4Nt4T18XBZzM2nD2qg7NeZA9qe3sbKS0D2OVlTNm9kEor/ooVr6LSUjeKIx0
         FBNocZrTwYStQOcKFYcKNCjHRcHddsadljs2mSSV5jfqwb46tCC5ELZNQBZrB1y7c9BV
         9xLB1N3UhXofCFiAJ0hM/KIvy1S60pGqxqL535mmOy2aIYrLO7Go0ccSFCt5dk0thWMC
         E9sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774317346; x=1774922146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xLM6YKJgxLhPQDfQX2m4g/wult9s4kqFfxzN0AZd8EI=;
        b=NbiyMGrS/cuxOyipyaROU8tE7Rn/Wn/fBuGrRJxKQHt0nlKC4QMJ0+rnoFiFbcG0TG
         BeXFyij6vq5PiAWdLR4pYP9RSxvmK6FUy1zH118NLGkJgOH9DCYBxG5yu8ZYFRmaXC/M
         pLiGzE2Sx72FCfjBixYbazEXub2cJvFmKwvIjvuLUCtGRt3ZpoqLUNs4dpy+vLuaZI0f
         Nm9Uov9I6lB5FBA3+iKCdRRsHEJxqD7nIWkpwUkZP0mkpTu1dn3sY0JJvDWJ2NumPQ6j
         K2MXYeFBbHC+g2JPPwHSpts05RfAM/DeicJAdTKZ5BBB9u+h/yqGUfDqeLhfHxOC5sXH
         c4Ig==
X-Forwarded-Encrypted: i=1; AJvYcCUvpx7/IMP+W38VZhYyl3aKC26vSCjU1Ul0yxSgyNJez0fcC9q5fCGKaLwmlKh2SZsJN5dQwhNWplZJiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2/4lkWBxpyPSzegw2iIAnE67E1xkYwYVIdto2qfMAQLfDj1aO
	pcjBvo0iuEZyLA1VyZjiGgivw9jnf0EOmgBZao1cVttB7ISJESXccnA8
X-Gm-Gg: ATEYQzyMvTOwQ3cpKnb6KP0e6qJBK526KrnT93lzMLIbQzhjqkwALYTFCMj8WCysybO
	G/dkED4clim/VYAS8445pGwXEaFJtixmt0xiS6pDUnAENA5hcTO/ZD9mEHC3R2KO6lJUCihilod
	MCIDitMeGi2L8y3McqpzGfV0aUEPkesowYLlAEv5aQA9q8VWGeqBL+bYTcjMWgq3GTb8DBbFioJ
	gNvw7OKbHOYKLtH1hKXLIi/YENZXWge/+p+FUg5ElYpGTvTyZnWFd9+qkDrkDhD766+wO3oUlWQ
	V3ufLy4NSqdGVkfHcFlLKsxck5jsAfaxZqzW0CF3VPxEPlGE1AU2XPJVahVXABSw/Y4Fa0hvFnV
	HJahQk815pHj2FK0jj0GY9sW+xblOzJCWdNm6cFkEXx81YUiUQomoHy9pbWV2Kx9Y/hr0x5znek
	d3QI6Q5Zx/5Dc5cOvU/GhuIx+lfF4RdpWeqb3nM+tpqEwsOe6mdzVTb9ikV4tP9m6Q7W24rTt5Y
	d3M9A==
X-Received: by 2002:a17:903:b0e:b0:2b0:4b3a:9b49 with SMTP id d9443c01a7336-2b082820d55mr126297125ad.51.1774317346318;
        Mon, 23 Mar 2026 18:55:46 -0700 (PDT)
Received: from deepanshu-kernel-hacker.. ([2405:201:682f:389d:62d5:79a:7a92:c774])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083527f90sm121657735ad.19.2026.03.23.18.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 18:55:45 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: mchehab@kernel.org
Cc: harperchen1110@gmail.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	stable@vger.kernel.org,
	syzbot+64485d3659c4c07111b4@syzkaller.appspotmail.com
Subject: [PATCH v2] media: ec168: fix slab-out-of-bounds in ec168_i2c_xfer
Date: Tue, 24 Mar 2026 07:25:39 +0530
Message-ID: <20260324015539.1451660-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,syzkaller.appspotmail.com];
	TAGGED_FROM(0.00)[bounces-56783-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kartikey406@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media,64485d3659c4c07111b4];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[appspotmail.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,syzkaller.appspot.com:url]
X-Rspamd-Queue-Id: 8A270300C31
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The WRITE_DEMOD path in ec168_i2c_xfer() checks msg[i].len < 1
before accessing the buffer, but then reads both buf[0] (register)
and buf[1] (value). If userspace supplies a 1-byte I2C message,
the read of buf[1] goes out of bounds, triggering a KASAN
slab-out-of-bounds error.

Fix by checking msg[i].len < 2 and returning -EOPNOTSUPP if the
buffer is too short to contain both register and value bytes.

Fixes: a6dcefcc08ec ("media: dvb-usb-v2: ec168: fix null-ptr-deref in ec168_i2c_xfer()")
Cc: stable@vger.kernel.org
Reported-by: syzbot+64485d3659c4c07111b4@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=64485d3659c4c07111b4
Tested-by: syzbot+64485d3659c4c07111b4@syzkaller.appspotmail.com
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
Changes in v2:
  - Fix author email case (Kartikey406 -> kartikey406)
  - Add Cc: stable@vger.kernel.org as the Fixes tag points
    to a commit present in the stable tree
---
 drivers/media/usb/dvb-usb-v2/ec168.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb-v2/ec168.c b/drivers/media/usb/dvb-usb-v2/ec168.c
index 973b32356b17..ebfb02826b20 100644
--- a/drivers/media/usb/dvb-usb-v2/ec168.c
+++ b/drivers/media/usb/dvb-usb-v2/ec168.c
@@ -135,7 +135,7 @@ static int ec168_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[],
 			}
 		} else {
 			if (msg[i].addr == ec168_ec100_config.demod_address) {
-				if (msg[i].len < 1) {
+				if (msg[i].len < 2) {
 					i = -EOPNOTSUPP;
 					break;
 				}
-- 
2.43.0


