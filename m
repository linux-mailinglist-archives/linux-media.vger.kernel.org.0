Return-Path: <linux-media+bounces-57690-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAMuLK0Qy2lCDgYAu9opvQ
	(envelope-from <linux-media+bounces-57690-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 02:09:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC27362927
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 02:09:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 565F1303743A
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 00:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CDE0175A93;
	Tue, 31 Mar 2026 00:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="Bi5w3av7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7CF74C14
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 00:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774915676; cv=pass; b=G1QveTsZJGKWFheIoxZf53EzDSeHeTJUq/566QLBeI48lO36VZgULdlGUjRPXzZ0E3n4M2RWoftsOAoRdVANv/OdntnmwBEruCFQ4MB9oSg2AxdY53+P6sOdTs7l/SDBgXVC7LmcQLZAHiymii0Cn7Z9JMJ7E1mGtldBdTStMQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774915676; c=relaxed/simple;
	bh=kvNS4jrTKNThGiO49BMz7mXMS60LyAjy24E/Nzyru+8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=In+2Hh4MOjh1wTY1IGqhyhr4bpwK9KcLavXSFgmQ5u+vFjA/+Jds5aktKCJN/6UPo8C/ASmY9y50yV/44aNxU9yYjSgF73Fxzia4nOmxf+QQpfgrkgLburR4RhJnoXnJ1xdmZxiuut8iUw7EiNsueeqpLS9K67vQJFGKh/Cu7zs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=Bi5w3av7; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-65003f40a22so5951114d50.2
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 17:07:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774915673; cv=none;
        d=google.com; s=arc-20240605;
        b=lVlvkNjv3R8Wl8xu5pfODTOvu+XZNtmVcVUMh16zxNpUbr0NR2wjBhDv+BxXfPVgGy
         +O2W40UxfQdbRzhn3yeQHKPv+3FLtjovCukbEzEn6wDOv3c0vP28VPxFZTt+EtT/OTDT
         n2GW/W5beQMWIb5X0S2R8RvuEj3+Uuo2pk93zxYUS3ovHXYKjZXE8Vwkfb9bf8XKiLGM
         bfO3VEM8EQ+VIMtHV00QakE3qeleyyJBYL0soeW4E8niOEpAZKfwX7j7xcE/ktj5BJjX
         GYLq1x4GbIouGLkuyc+hMDk72ueqZPSObDna7+IfisTWmfOsA/H5jFy8Tbe1q+i8omB/
         BNbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0aiGgV4znT/MrEJo920Y34xdg0R+ZL3fdPeG6yCs7CI=;
        fh=hYau1tlYUfO+L+5NOdMno1CvAZHMV4b3jCxsOJJ+NpQ=;
        b=Vyzk3cfLScJ25WAXDjQjqYTHTCPykuhyikom8enX/ay041bPHP9tUdouQXUSh8fIT0
         FeLzh1F7HVapgIQUOfDqvuOR4eKRW/18XrEI8+Lgbk2bEsk6oGp+LG8t+L358uVuzCyB
         GYMu+OjEbVsFt13jnwjLd04kdlO/jri7qFIl/tgSmzN2UF7/qRuS5r0CDyGEh6DdA7pI
         y3wbe5oEyM7c4TXVyAxO68knAfUWfwwweQWw3XFB9ATRhOUNfA4IRp9ZN42QpuU/dwHR
         UWmWPkEH2VTHKAqvcbPn0wYT1UYT7tAgObaN1i11AX+cmmd8bDntfkMS2EKEhlTxHAoJ
         15cw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1774915673; x=1775520473; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0aiGgV4znT/MrEJo920Y34xdg0R+ZL3fdPeG6yCs7CI=;
        b=Bi5w3av7VUE2o8tn1uwELmmXZV3F1N8z7zOf/hSAxiASLrMh3k8t1gOyQUoEm5PW/V
         2IlO05z8dgdBrX/vE/poN5ZX/nss0IE+aQYoZsNti6baBwaWs6Amjl3A/c5MF/rpgJIL
         qQJ716Ypaoi7KlBDcnMYIG1q33NB1tQhqU3wpK5N9ZRS6SfBf/J6x6vdWAVeUzItksdy
         3eAKQ61ckB0JCkxuTsQe6drnOZ6zdlwdZOFATbZB2WfUmqbdrHPP8aB6J4FpIHECzXiZ
         /+qlnhO+w50KZ9XYwV9mI5VcQivg7ZJp9a0qTy5ADqs067iqcP0oWczeR2ZqKMkg1xzM
         v4Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774915673; x=1775520473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0aiGgV4znT/MrEJo920Y34xdg0R+ZL3fdPeG6yCs7CI=;
        b=dgE4C6YGv+ZxJDDx2uSrog+xxFEq+jh72MLiWRXiFaECGLwZFSPHnlnw2m0mSEYatr
         uAR+nOdsIcXuTevuYxlED0gmSPrhGFB2LwNc323FzhnsXunmqh44+Z3lTDgxk58jdqZT
         S75aC6iEfUHwPNFlQpRljm8HMjUr78rlLpz1WW5MZdNRw07ZqiOeDhToRGp5cY0LIu9J
         NJ1rXHFeXPdIvo83bKeFla71KJlzwQebfChUWiKTTIKWrl/Uvy08Yz9YKJIL7/bU1rKD
         eyyOe69+KWm/JFvthtYBuRWTo9azT+BOgDznHvMT6pVqZk2eH6d+5eRfUl9SetnwRgFT
         t1ow==
X-Forwarded-Encrypted: i=1; AJvYcCXJyAl1ZQxy/s9ZkptTiBzgOGO0fNb+3LD3pQSussasvWHeyf3qx+b6PKc6rg+L0lCyLyfjU7RCW73owA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuEW/jO5ERy0c4QJbscFFsZOGSAXzxErW1AfSs7rsj1nCVDsK9
	9yowzIXa3bueZRtgy+JkNtzywGSjZ67dWJCf/emLpBSP+mstjQhM3sjU12oitxyPNWnHb+Joj0L
	CzeLjx6oDr/XOZlkRouCAsH8o3eDi+5x1QliTlVwJ
X-Gm-Gg: ATEYQzwjqbyP3ZkZsw/UjM1EsTjb1fLi4/o1FTKBNrAV15znZPmVA7OvnfmZKHywYE2
	vkfzD+QLhu2KIo/ZPS2aS0EHgvzSUABfZ3RBfaaOv6WN9bKyyohEZxnhBr6MfKMQEJGXb2Xj2Cf
	ht7f6iK3VreqyPxqGdwKBoZEcGsfLP9RfZCWQci+eeAZTPhGg1M/DxdgT7qsAuDO0KfPv9Z4/+2
	BUGVFRsYAm5BU7ugjhkhS9zKgpRGFxP+9GyDBafAObh5ANkfhwRo3i6U2KV3xuopejWmpseTqTb
	k72xYtgTNaR+NBI=
X-Received: by 2002:a53:ac95:0:b0:650:19a8:2ae2 with SMTP id
 956f58d0204a3-65019a831a9mr6375585d50.25.1774915673080; Mon, 30 Mar 2026
 17:07:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260321223713.1219297-1-jp@jphein.com> <20260322055354.03399a32.michal.pecio@gmail.com>
 <CAD5VvzBE8Oq80EhFZnZ7kNrRC_rpoR25Ct5-Fg62yDZUHVtWzw@mail.gmail.com>
 <20260323085845.6bf57b3b.michal.pecio@gmail.com> <CAD5VvzDWF7SO0Aytp3K_uXV6ZYoqEqN1dhfv7VtMAHSpHP+qTA@mail.gmail.com>
 <20260329174022.6513d797.michal.pecio@gmail.com>
In-Reply-To: <20260329174022.6513d797.michal.pecio@gmail.com>
From: Jeffrey Hein <jp@jphein.com>
Date: Mon, 30 Mar 2026 17:07:41 -0700
X-Gm-Features: AQROBzC65uQWp9GEtVFzdYryhIRpVWhTdTI7oafhHvD_kOc7K_CrPhhba6QgsCM
Message-ID: <CAD5VvzA1XnNKk3W2sVP7fjPF_BNkkSQ2p_4xhwnE1yV8zFOhSg@mail.gmail.com>
Subject: Re: [PATCH 0/3] USB/UVC: Add quirks to prevent Razer Kiyo Pro xHCI
 cascade failure
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[jphein.com,reject];
	R_DKIM_ALLOW(-0.20)[jphein.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57690-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jp@jphein.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[jphein.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,techempower.org:url,jphein.com:dkim,jphein.com:url]
X-Rspamd-Queue-Id: 1EC27362927
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michal,

I spoke too soon. The stress test (rapid v4l2-ctl control transfers
with no video stream) passes on 6.17, but the crash still occurs
during actual use.

Starting a video call on 6.17.0-19-generic triggered the full
hc_died() cascade. No patches, no workarounds, stock kernel:

    usb 2-3.4: disable of device-initiated U1 failed.
    usb 2-3.4: Failed to set U2 timeout to 0x0,error code -110
    uvcvideo 2-3.4:1.1: usb_set_interface Failed to disable LPM
    usb 2-3.4: Failed to query (SET_CUR) UVC control 11 on unit 3: -71
    [errors escalate from -71 EPROTO to -110 ETIMEDOUT]
    usb 2-3.4: 3:1: cannot set freq 48000 to ep 0x82
    xhci_hcd 0000:00:14.0: xHCI host not responding to stop endpoint comman=
d
    xhci_hcd 0000:00:14.0: xHCI host controller not responding, assume dead
    xhci_hcd 0000:00:14.0: HC died; cleaning up

I also ran the stress test during an active video call with dynamic
debug enabled. The firmware locked up at round 19 of 50 with repeated
endpoint stalls:

    xhci_hcd 0000:00:14.0: Stalled endpoint for slot 17 ep 2
    xhci_hcd 0000:00:14.0: Giveback URB ..., status =3D -32
    [repeated every 2 seconds]

In this case the xHCI controller survived (no hc_died), but the camera
was frozen and needed a physical replug.

So the pattern is: the firmware cannot handle concurrent control
transfers while servicing isochronous streams. The stress test alone
passes because there is no isochronous load. Add video streaming and
the firmware falls over. The 6.8 -> 6.17 xHCI improvements help -- the
controller sometimes recovers instead of always dying -- but the
firmware lockup still occurs.

Full debug logs are at:

    https://github.com/jphein/kiyo-xhci-fix

I have dynamic debug enabled for xhci_hcd and usbcore going forward.

JP


On Sun, Mar 29, 2026 at 8:40=E2=80=AFAM Michal Pecio <michal.pecio@gmail.co=
m> wrote:
>
> On Sun, 29 Mar 2026 08:03:42 -0700, Jeffrey Hein wrote:
> > I have now tested on 6.17.0-19-generic (Ubuntu 25.04) with dynamic
> > debug enabled for xhci_hcd and usbcore, and without any of my proposed
> > patches or workarounds applied. No udev quirks, no LPM disable, no
> > control throttle -- completely stock kernel.
> >
> > Results: the stress test passes 50/50 rounds with 0ms delay. On
> > 6.8.0-106-generic the same test crashed consistently around round 25.
>
> Thanks for the update, that's good to hear.
> Hopefully it will still work without dynamic debug too.
>
> If you would want to fix the old 6.8 kernel you will need to talk with
> Ubuntu about it, because that version is no longer supported upstream.
>
> Regards,
> Michal



--=20
Jeffrey Pine Hein
Just plain helpful.
jphein.com =E2=98=80=EF=B8=8F techempower.org
(530) 798-4099

