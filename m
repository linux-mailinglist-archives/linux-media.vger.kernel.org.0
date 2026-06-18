Return-Path: <linux-media+bounces-65185-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7NgLF2HdM2rQHQYAu9opvQ
	(envelope-from <linux-media+bounces-65185-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 13:58:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8C869FDC2
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 13:58:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=VHsa8HF3;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65185-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65185-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6A2CD301AFDE
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 11:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EFEF3F4130;
	Thu, 18 Jun 2026 11:58:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D323EEACB
	for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 11:58:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781783900; cv=none; b=LkmeM0QJB9PzKDQW0EoXI1XrsgXnxNxlhBveYeHaPNSPhqxP+lHl79TrvV6v1ncc5jqbNRVeyIE26NzQlHEGxi4bcVXgT6vUDAiBiLexCSUBDQjqIEbawIKz5xmpRsdyHYBveFe7WMbrtU3UNQDWM5YkwVBZ9V2xWlavRMLKuYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781783900; c=relaxed/simple;
	bh=eB9HLkIkuW053AdKtEc37kYxRzNyrSgnuiwcsd1XS5k=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=cf9ZCuMXtoq4Wuq5NyCC0XWSAQs07DrYhvtVW9RoJJ8iQIBQJ7+jeEQl3gKqIOZlZ9VWwDH3UDQZJNZ871n7bOSLe4OF+PLg7yeLfzrmhxfNlGS8nKMW3ELhnsmaAoBvH65JEL0gX4BMszCKHo2nlcOxFyvqNnL2WB99o12RVME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VHsa8HF3; arc=none smtp.client-ip=209.85.216.49
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-36d8b644473so623546a91.3
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 04:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781783897; x=1782388697; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l6ZpEPMGEXJfOM8ksIepPSzLXhdH5XV51m7wnVrOXO0=;
        b=VHsa8HF38avQF32VzmyFb1zQkM7ko1qCh4kNy4PBd8jrGohDfZEo5jrpyIIRE9FiU5
         Rq8BAkn5soDrqkC57xiwjIalJPzljFNKXq5XCwdCDZamlH+57WdQQe2/y9fnLcninpd8
         i9sNpTdFXIyB7YVxOGcGfcZxlz4A6dlzY8kv7q492xmZ2fN+iJFvYZfRv3ODsKqeat5K
         PkZQS6U3UVkJyk7RDttJY+f5LAiI0DZq+Zcoo/88RCDuMWUPOz3KlElpP0hvld03X6yp
         LqcB4UsC4WOIC6GptiujwxFPGKbwE0v9zG7N+8t4ASAohrw6636O6YJJqlcB39vJTrnO
         iHvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781783897; x=1782388697;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l6ZpEPMGEXJfOM8ksIepPSzLXhdH5XV51m7wnVrOXO0=;
        b=U5DaqlVWtcTmBOxD0Dgz44XfVR1AsMxMoXY6Z2gguztXxgQSYDfSewQL94srSZvKRR
         0eqHJhWQ+rRg4xW/ECLzzEzhXyHmx3PTjfwzw4wRfPjtmq6a1z6HbvGl07xsOHL2Z8LN
         hZSlabufZ+J/mQG70+TjVM0vjAJgHtsf1S5Ncb6XQQ/erpMaclDCH6J+3W5jEYxCO4do
         c4xsPIap4B/mvBBBle3FmV/oaesTndBJHqfdsYXJFU9DAh5nM7LLBNZ4sgyq0p6tCXR2
         TiU1vriCEWQwdOMzLy/DPVDH48L9wQvLikVyrWbPCkxSXhHgrEe5/TOZaWZCHm/2G0E5
         FOlA==
X-Forwarded-Encrypted: i=1; AFNElJ9+l8OiPfRe9sCgTk9ghB1yDLgQzk+N9oHl/exoQpzAIqj1HnvRCkJ77Q+FlyqDAwVfjcCh7a6NNKFZrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrqMCWV34lMaCwEX6Z3HLu3qSrXB+mlkAEHB0VRGHWk9Q9T0Dq
	hDcRafDAZGePqvEY1DDKVSmcpUGRj8FvwunUsqMJ459gICX0C5sjJLed
X-Gm-Gg: AfdE7cngs6AHrOPBy4NqE5ZRgu/KE/+V87iGgJE+nRRHzqgI+VzX56eZ+xby9cmcyg1
	4NqPWynNCO0S3zYny73fhiAnb5sLqT2v8LDIIivdeRgDR5TW0uuwlZristXDTI/P4rCsTp91NJU
	K/A9NId4diEUEcSZZ4GMSHmEC0+g/CnN4UjWrx/qGcGVT3AdZlAczmKPkjo80p+fUrUIH07IQVT
	NzCasbZaqpabd2tk8X710gHkg5tO33ziOjIFEMwJUI+C1ZsYD9RW9ikwuSD8i/f5l/5iPk+nLf3
	ACg8H8gSwQxYbteqeaxcHrQE6WZT1YQYHIghcEaRt7CSpSiOQ4wI08ttwbH2ML0Wwbh0D8uiNDN
	pL626KEoDaj6urhtL986sS6bbzXXuUfEXuCxOVMzgE1lOg6n7Ec5Cqy/IM1ohsrpOYCXhdSv+iO
	xZ0xas50bs7kQw59aI1vO1yPsE7nhpnp4hJEWqTA==
X-Received: by 2002:a17:90b:49:b0:36d:70c8:3a3 with SMTP id 98e67ed59e1d1-37c9404f8a3mr8547821a91.15.1781783896587;
        Thu, 18 Jun 2026 04:58:16 -0700 (PDT)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37ce7d5c7f8sm1443227a91.2.2026.06.18.04.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:58:16 -0700 (PDT)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Stefan Richter <stefanr@s5r6.in-berlin.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Subject:
 media: firedtv: possible out of bounds write from a CAM response length
Date: Thu, 18 Jun 2026 19:58:12 +0800
Message-ID: <178178389268.3526268.13296040644459169135@maoyixie.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65185-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:stefanr@s5r6.in-berlin.de,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux1394-devel@lists.sourceforge.net,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[maoyixietju@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maoyixietju@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EF8C869FDC2

Hi all,

I think avc_ca_app_info() in drivers/media/firewire/firedtv-avc.c can write
past the 256 byte CA message buffer when the CI-CAM returns a large length.
I would appreciate it if you could take a look.

The copy takes its length straight from the CAM response.

	pos = get_ca_object_pos(r);
	...
	memcpy(&app_info[5], &r->operand[pos], 5 + r->operand[pos + 4]);

r->operand[] holds the raw AV/C response bytes the CAM sent, and both pos
and the length operand[pos + 4] come from those bytes. The destination
app_info is reply->msg, the 256 byte msg[] field of struct ca_msg. With a
length byte of 0xff the copy writes 5 + 255 bytes starting at app_info[5],
which runs about 9 bytes past the 256 byte buffer.

There is a FIXME right above the copy that asks for exactly this validation.
The same unbounded pattern is in avc_ca_get_mmi() a few lines down.

This looks like the unfixed sibling of CVE-2021-42739. That fix added bounds
only to avc_ca_pmt(), the host to CAM PMT path. It left the CAM to host
app_info and mmi response paths untouched, and those are the more natural
attacker direction.

The path is reachable from userspace. A CA_SEND_MSG with an APP_INFO_ENQUIRY
tag followed by a CA_GET_MSG lands in avc_ca_app_info(), which then copies
the CAM response. The attacker is a malicious or faulty FireDTV CI-CAM, or a
spoofed FireWire node that answers the request.

I reproduced it under KASAN on 7.1-rc7. A length of 0xff makes KASAN report
a slab out of bounds write past the CA message buffer. A small length stays
clean.

The fix I tried bounds pos and the device length in both avc_ca_app_info()
and avc_ca_get_mmi() so the copy stays in range.

Does this look like a real bug to you? The code predates the git history, so
I am not sure what to put in a Fixes tag. I could reference 35d2969ea3c7, the
commit that bounded avc_ca_pmt() for CVE-2021-42739, since this is the same
class left unfixed. I am happy to send a proper patch.

Thanks,
Maoyi
https://maoyixie.com/

