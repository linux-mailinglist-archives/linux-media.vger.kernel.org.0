Return-Path: <linux-media+bounces-60189-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONfTDWjZ9mnMZAIAu9opvQ
	(envelope-from <linux-media+bounces-60189-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 03 May 2026 07:13:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A64F4B479F
	for <lists+linux-media@lfdr.de>; Sun, 03 May 2026 07:13:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D1A9930073EF
	for <lists+linux-media@lfdr.de>; Sun,  3 May 2026 05:13:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFA0838553F;
	Sun,  3 May 2026 05:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="INWgKeJQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2337C2C21EE
	for <linux-media@vger.kernel.org>; Sun,  3 May 2026 05:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777785180; cv=pass; b=eIXoj9cOPSiLCjsZMlLuRgvsBmWbXDbMhvqs8tsjJhB6v0NrGCY8uzkqGRf4YcuqFepv3vxJdVqhVSsSvonUUK1GzFSgHbgoshE71e9t2dpxwD501YbxD8uZRtpAw3Pm7DJK2NXpE/rrq1D9fR7rw0wz7SqFACKwG+wnPk5DaS0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777785180; c=relaxed/simple;
	bh=VQI5a42Ek+RqQPHOII4Y06s79MSK8X4Zu/WHg2CNknQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vGZTSbqy4hMPJEvuBcBbX6zUJe8cW265xQrDJfVGrmKlTvNv2KoP50V74iy12nq4+T4fOr51Bzu5rXczeEPEU1Lb4bS+BlcqksH6RmSrGw2lBNW7MY4jKNhd4ythZ/DPBq0M9BcXqyX0IHi42rfFCUivrFT8cpKy1ox+ZozmrdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=INWgKeJQ; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7b248750279so30141447b3.0
        for <linux-media@vger.kernel.org>; Sat, 02 May 2026 22:12:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777785178; cv=none;
        d=google.com; s=arc-20240605;
        b=P2+lj6/mXeJcCrQY6C6JIMak4I3YZo0DzBxhyjJD4u+ygn1plBFhSt7yIQRk0zrwio
         OeUCUskQiDCzCVgbBCQvRCilaMXVlybVres0QKNEBSbIe0FhN9umcJ3lC1yrpMI4vrVw
         +KpfqU/ibeMudt/KLFPo+Xci9OQqF5hJydShu1++m5Cx3pdKilJbp/3kR8LHZ0kcOs7/
         X4IKprRHhHdEdcaQMGD1yEOH+E5RXLiHhOO80zYI8gxw4Efiz+vswInkw1Q+InGVjLep
         Mv/CwUZZtXSc94rOASPCFD7TjJ5dBtA4wKilGBEkI7yHRrt2QkbgTnhGoJv/29MUBkdf
         NKZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MX6+eljwst5hAwzbMT82717o/7NySMaTnB5zbbXnmlY=;
        fh=AM9V08wixBy8dI77uM08XuaSsaSM9hkE+YhSSJlmcfI=;
        b=gontNAZUvEbjHavH6lyqwMdpMch3b+alhibY+UWi0y1IJerVVtBkvvjFHe2pdXBL0m
         fnD3O+DLBnFoU+XYx73U1u8slK1lVQftht4FYZO9Ax196tuUx1Bku41qmDO3yfazOS+C
         aJpv8sWr7kSymsVGh3Id8j0AY/vkaMq0M2xWPyZH1olX8pxD5nl2cCVg6m3HoGRbm7pi
         0vTmJ2r/AsYnYkz4mF8JIGIXBeP92b9LquceMtgqQtCUfd2/gpnI9Ad+TrsUJb/bDfc/
         LRqRDN0wItsl55Y4yOeWdwSf6RaXG3q5vAlRpmD5xLPHEsRoYmzlKSN09AFLoQV9/ZYD
         eBsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777785178; x=1778389978; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MX6+eljwst5hAwzbMT82717o/7NySMaTnB5zbbXnmlY=;
        b=INWgKeJQa6uajOqGq5FW7LT+LcLdcNfXGvLfvrh/JENzSxZzYK2m6exrV5uPvpXrez
         FiV+cfmGh3VpZ5wLeRi4J32FVvcmbJ12sTpWdL8GEZ8VqomH/YLXztadERQPu1eKe2Nv
         tO8f2RBfEnJNYgOOFmLz0qbByozSuBw/DSJA4ibErrUS0pLmgwPOiEci+jEJe0lpkV0r
         kGBjIrqiHg0DgoQ/xxuEDD47OALII9FbNbigfnJlVbmUeJWf/ghDjjRroqLTVyVw+Xgu
         cw9qaiaUBXVJxel7AObLtNf0yhxcmVpBGkyyHN6WrvjAykv4LGeP82QvcoFB9c7qMyqB
         ZCAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777785178; x=1778389978;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MX6+eljwst5hAwzbMT82717o/7NySMaTnB5zbbXnmlY=;
        b=dL7A7uvjk/IX9Ribrk3Lbwe9CABn1VaqPMx1yuC0P8o765yqMiZOE3ZUTRypbqtVLB
         QtKPbeu2zH3ulrUda6KRy7PwQj3gXakpkItSY3IULT6TtXi7laFWHNmOgmfARg/id/To
         y5/oMHo+St1oYb/fxIpkwQe6iqbW+Er1xtqHzBiSq5BtYp79SQDCbt8tgv640AgRAZ+f
         EO56/ZodIwUXEP4/1bDq98/ZVPld3kH/vNFiG83qi2gLSoF3fsagG3CJKbS2gho2N+wN
         bDcqrNppr9AjEhajVTuJgVcmEDDd5rJ7Xgv1L+YEPoUgUyF/4ilSHJH0/3dc3OiqV78l
         d/Hw==
X-Forwarded-Encrypted: i=1; AFNElJ9pVWfVrRFtz0e5fZ1r9cnww4OqwZ+Z8iJDN9MyjbZhIvawcLLN3B9wZmQevdcy6W5DJdL46bV3CDv+3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcjfMApwI+Ui6wLgS1LTO24jYqWqaPgCp96XPOiyFqkhpxdSWR
	B6t9FLuZ6cUfY9kKeGmPI2BXFOEwZm9pXC6E1tY11x8h1aUNXgmdGSQKRT8N+031lUliO8umWCY
	FJk66kC96smQD5qMe6c6qELEEmdpVIjg=
X-Gm-Gg: AeBDietkghbX+VUnT1SAgzd7zY5OwbMC1HSyPwo2aAd9lI0I+ItNUFrTdN+FoPGB9Tr
	PtTWBg0RBQrMGv1eGcEUmpofKRiMQHaUGpz7RqhKacqdppPdKpg1QhnrANBEDnl67eKEXvAh7Iz
	HTNeOA3VyGTrQyo3PcZda/CA01zzvR/dqIitwP/b7Ltn1VBpQIym1qekqTfhhIoo5DuNK5KNMzS
	48u3WntPVgWsuv5HYHMZ2fHch20PPhq3qn+bIqyRRnlu7RJBgaHGY0uunWQhnp8q6za24nE/GYt
	w+bc96ujvZBFT1q3kuNdgnf0ECo5z3ig6Eqa3oXbt16dTxo9YkiB9ouD3yw4bSakboI2VBEqVrn
	6vWImqXU=
X-Received: by 2002:a05:690c:9d:b0:7bd:5af0:3bed with SMTP id
 00721157ae682-7bd77003e53mr52333397b3.21.1777785178050; Sat, 02 May 2026
 22:12:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324015539.1451660-1-kartikey406@gmail.com>
In-Reply-To: <20260324015539.1451660-1-kartikey406@gmail.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Sun, 3 May 2026 10:42:46 +0530
X-Gm-Features: AVHnY4IWh3MZLwFApCupnMNXGyC5GEFz_oe-ppOy2nxNl-bFO3x8fJRsVpn3Anc
Message-ID: <CADhLXY4meyw0JuXjwhTjPEh4saZprqQfdO6GBdYBjANXsGUm+w@mail.gmail.com>
Subject: Re: [PATCH v2] media: ec168: fix slab-out-of-bounds in ec168_i2c_xfer
To: mchehab@kernel.org
Cc: harperchen1110@gmail.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	syzbot+64485d3659c4c07111b4@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 9A64F4B479F
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-60189-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,syzkaller.appspotmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kartikey406@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,64485d3659c4c07111b4];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[appspotmail.com:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Tue, Mar 24, 2026 at 7:25=E2=80=AFAM Deepanshu Kartikey
<kartikey406@gmail.com> wrote:
>
> The WRITE_DEMOD path in ec168_i2c_xfer() checks msg[i].len < 1
> before accessing the buffer, but then reads both buf[0] (register)
> and buf[1] (value). If userspace supplies a 1-byte I2C message,
> the read of buf[1] goes out of bounds, triggering a KASAN
> slab-out-of-bounds error.
>
> Fix by checking msg[i].len < 2 and returning -EOPNOTSUPP if the
> buffer is too short to contain both register and value bytes.
>
> Fixes: a6dcefcc08ec ("media: dvb-usb-v2: ec168: fix null-ptr-deref in ec1=
68_i2c_xfer()")
> Cc: stable@vger.kernel.org
> Reported-by: syzbot+64485d3659c4c07111b4@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D64485d3659c4c07111b4
> Tested-by: syzbot+64485d3659c4c07111b4@syzkaller.appspotmail.com
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> ---
> Changes in v2:
>   - Fix author email case (Kartikey406 -> kartikey406)
>   - Add Cc: stable@vger.kernel.org as the Fixes tag points
>     to a commit present in the stable tree
> ---
>  drivers/media/usb/dvb-usb-v2/ec168.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/usb/dvb-usb-v2/ec168.c b/drivers/media/usb/dvb=
-usb-v2/ec168.c
> index 973b32356b17..ebfb02826b20 100644
> --- a/drivers/media/usb/dvb-usb-v2/ec168.c
> +++ b/drivers/media/usb/dvb-usb-v2/ec168.c
> @@ -135,7 +135,7 @@ static int ec168_i2c_xfer(struct i2c_adapter *adap, s=
truct i2c_msg msg[],
>                         }
>                 } else {
>                         if (msg[i].addr =3D=3D ec168_ec100_config.demod_a=
ddress) {
> -                               if (msg[i].len < 1) {
> +                               if (msg[i].len < 2) {
>                                         i =3D -EOPNOTSUPP;
>                                         break;
>                                 }
> --
> 2.43.0
>

Gentle ping on this patch. Please let me know the status of this patch

Thanks

