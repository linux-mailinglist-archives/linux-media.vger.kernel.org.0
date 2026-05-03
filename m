Return-Path: <linux-media+bounces-60209-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAIICjDS92kBmgIAu9opvQ
	(envelope-from <linux-media+bounces-60209-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 00:54:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B944B7BAF
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 00:54:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E622130107C8
	for <lists+linux-media@lfdr.de>; Sun,  3 May 2026 22:54:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8073B3B636A;
	Sun,  3 May 2026 22:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="ro/ZuNE3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C9D3AD537
	for <linux-media@vger.kernel.org>; Sun,  3 May 2026 22:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777848866; cv=pass; b=JVChyI7jytCle8U2pAPUNeZsp5ipHzm392OFjbtwBSvJsKOAC6Rat01o/H+TBH2EHbQuaubyOueutvFiCfLD4AcNp+pIhCKzaU5eXrHd9WPoJy4+45/MFqQYCT1WBbjBvdQ8p9e58Ugua+zdoKvJWmtjYyncDZx46s/qBLLctt4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777848866; c=relaxed/simple;
	bh=HHUqSrSbpan1HpTwDObpiGld6DV6AUvdUllNygldI6s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HXCai2Ol5KPSOvAu1fJHxwFU5P8kY/tNYn/aoSo6WOzPV0VeiCXhA1y98tSWH9tzL0+nLD1IupYbRHRvrjQa6uDjYKSlA3RVR7FuQZh5Gs8OJAeF/XEVTfJVkv2xijx0Eh62yi7WZ3gA4f+dq/cUFvApGX8LgzKpaMeVbgBEAqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=ro/ZuNE3; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-79a46260385so42188327b3.3
        for <linux-media@vger.kernel.org>; Sun, 03 May 2026 15:54:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777848864; cv=none;
        d=google.com; s=arc-20240605;
        b=gwOPGwtVajDFhPdFD+HiJYhLgFvhnRN+oYcGIvHZWJbEOIoK2Yan7Zq3w5eepkxn6t
         OAu+pE3APBoBNZCFmcqmqT6+HqpWGctO+cEmuLNmYBgfj+Vwqp/LMnyPCtjG5/SoKStn
         L12Te8XzpadCEwGfB8u5QQNiNcEt0d/ZA3lANm6m4FW/RCeDB0fhZI5aIpvOqTNwE5/J
         rKdD1e79YmaN3bX91V5rk5rEZ06X5v5KxBMKD1x8rMGqOS7cnkMRWH71Kce+U9MQR5Td
         Wkn2ksvqt7nCQ4LVbJSQzVa//JDp/2WoHr8oHY/bDcfndAtrUXrVmB3MHuQ9XhOGfiIC
         FXxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HHUqSrSbpan1HpTwDObpiGld6DV6AUvdUllNygldI6s=;
        fh=O7EXtrjs1dbYLRzUbhzazrgWitsVB+jN2FCv5Kr8w8g=;
        b=M2g/Xml6WNMi0uxJieMBLEl7aj5/W7vsRfmOLv8g5ycn6shakoPdxarrnXg+DXNkLU
         5Chmgvs8LydHaMl6b9kWrpwKZQbVEugwjuRHs0qBx8MpwW8F4fbtQuIy3s3l7WORxoeM
         us3Jna224Ex8XX5x5yUfaZ0fk8J/ps2bmuEFGmpSEfgqsueUS4mZKAXKGa6JlcfR/iO5
         /eurcE8rGsOidfE0t8mRqq1z9ZVELf8Sr9JcsEE2SmABaZcGjO8Jpkw60SO9qRvGLgJm
         GJmWM8TvIGvY0/fzfWmjmcg0L0W32IMsSEsAGTL/DIAOWoAwMMlM2t7P8CdpmLploVvd
         Ux2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1777848864; x=1778453664; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HHUqSrSbpan1HpTwDObpiGld6DV6AUvdUllNygldI6s=;
        b=ro/ZuNE3pVqllqIDM+3LHjjk07H/en/yCwVg81qNldQ+fHL729xp3l/ycTIASeWKxZ
         yJtAtuD37tcyiTAQR96h7ybGM6lST8P+MV9GkFvVQoq0hgyIt1LXvgAQdJz+E/zAHvZn
         /BtUFg/XMr0S7kJwL1vR6e5uL6gHF62C9WYNmxbZ/hsoQng8XZjzuhB1BXRSqSs1Fzru
         Us1yJBlbIqBP4v6iiWFRBY9U73ZtJpqRHrHV636taXESqc0t5VznyV0C8+YI5G70wmh+
         hszAJ0SVDRr38RfW2FGd6EioQ4QuP5iFlflqvXiFpanYz2N6kxP/3i++KJSh3Nw9nyhY
         WA1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777848864; x=1778453664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HHUqSrSbpan1HpTwDObpiGld6DV6AUvdUllNygldI6s=;
        b=ZnBU/gL+zARsVe+SyoFMW3HLsJgiKnaX8dCu/teUEY9hNbG0gNEJb4pgiMSprblyuG
         Lx+RJ7KJ4ZHksUQuIwecTH1JkCb+ClxsMhLvBFSEW0zbAoZFDxTm+GBtJwfiVJynTswQ
         KK+8XaFctOzlNFUVwaefjz6AuFfGfQUPBZMcyxTeST7ws+I8PNy6x5w/Ak+7ouyqYpK2
         mz6Vv/R5F6MhpfbPPYe43HTbh8Dq7lJrq+RHW2xHulqebnw4DU7t7kFl7GM1MMA9Gi46
         KCXf/7usTx7Qw4OfjyZwvUgO6KwtyPvrUQ7XGjwtOJBLrEXHAPq9aRj7kZHjRLE1uqK6
         fb5Q==
X-Forwarded-Encrypted: i=1; AFNElJ+fWVg8w7yEMIuMjUM2ZoImGrVRs7E/inLCaQQkT7Q9s1tLWFjYvk6zsQvwOaacj6XA+25Hksj4Mfa8ow==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOSY9Dz4BVI1Yagb/pMiIOcKbDNkHXZy+0Or4khB6of7pOZREH
	1oKIph5Z0ne1ZURGwW+Om/MKN2rsgRnxxgWPp8UtkFGRcSJpA51YI8vETNdBF+qh+K7GSaQuiWO
	Rx1r6/vUvgZOk6Hz+Cclr/Pe+r0AAO18puAcRFhzp
X-Gm-Gg: AeBDiesW2zi62BRZz2hiN6QrPTa4BvoQpVtIS2lLsWGG7LHW95frblnrZIll11VpN4F
	T7rEvYqMwkoLIgPbAGM6BCkMoxkN/bWLkqzsASZa8qY/SeEZTyl/GOhacoqltsr8vpnjpyB95SS
	hrVMK5IXr3SGOqPmMRp8SKCf6WC+VWCUfvBILll+cmXsGMZW5jShgZl7FYEBf2aeXt3H6N336pU
	aDxRcAgN6/qiZS0g5QaatmIj/IS9RCYAjLsVE4elSgWogEri7jFkPG3wC6UtASIqii0GH7fh/ie
	lPS8f8uQYoorDKTv/NJ8bWWEs4lf4LQoAfViGgXvl/aftLIQ+uqNCMNwZG1Gv6SsRJbA48O+6VC
	Y
X-Received: by 2002:a53:b426:0:b0:651:9720:744c with SMTP id
 956f58d0204a3-65c3dbeec96mr6188357d50.63.1777848859718; Sun, 03 May 2026
 15:54:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331003806.212565-1-jp@jphein.com> <20260331003806.212565-3-jp@jphein.com>
 <CANiDSCvsxP+npQTHUrMTp+Z8XULYKSLTz2AFu+WQnsLbRBGa2w@mail.gmail.com>
 <20260409100247.7cfb62d1.michal.pecio@gmail.com> <20260409221749.5e6bccab.michal.pecio@gmail.com>
 <c4275422-a9b4-4519-95f9-1163a7912709@linux.intel.com> <CAD5VvzCEV_XbHc_Gby7mFPBSgSebqKDKJf3VC8HNRrD+xWaTJg@mail.gmail.com>
 <20260413100545.71796c66.michal.pecio@gmail.com> <20260427083553.36ff4731.michal.pecio@gmail.com>
In-Reply-To: <20260427083553.36ff4731.michal.pecio@gmail.com>
From: Jeffrey Hein <jp@jphein.com>
Date: Sun, 3 May 2026 15:54:08 -0700
X-Gm-Features: AVHnY4LhPRw4XrdZjjt_olrWEaNJISf_JWRrz01TpDM2605apcllR8Yxymswj_U
Message-ID: <CAD5VvzBKvK3Z0HLoNx0VEbgyzQVq1CHwMKpCEpdC8zs8OowTNw@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] media: uvcvideo: add UVC_QUIRK_CTRL_THROTTLE for
 fragile firmware
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, Ricardo Ribalda <ribalda@chromium.org>, 
	Alan Stern <stern@rowland.harvard.edu>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 85B944B7BAF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[jphein.com,reject];
	R_DKIM_ALLOW(-0.20)[jphein.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60209-lists,linux-media=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,dmesg.post:url,jphein.com:dkim,jphein.com:url,mail.gmail.com:mid]

Hi Michal,

Both tests done. Intel xHCI 0000:00:14.0 (8086:a36d, Cannon Lake),
kernel 6.17.0-20-generic stock, stock uvcvideo. Two Razer Kiyo Pro
units (1532:0e05, fw 8.21) on root ports 2-1 and 2-2.

hammerint (2026-04-29): 60s per Kiyo. Kiyo 2-1 logged 413,738
submit/cancel cycles on EP 0x85 IN; Kiyo 2-2 logged 416,350. Both
timed out cleanly (rc 124 -- didn't kill the HC). Zero xhci_hc_died,
zero "event condition 198", no command timeouts in dmesg.

Caveat: usbcore.quirks=3D1532:0e05:k was on the cmdline that boot.
Hammerint runs the link at full throttle so it never gets idle enough
to attempt LPM transitions -- NO_LPM should be inert here -- but I can
re-run without quirks if you want a clean reading.

stream-mmap loop (2026-05-03): 300s per Kiyo, MJPG 1920x1080 @ 30fps,
no quirks on cmdline. Kiyo 2-1: 134 open-fmt-stream-close cycles on
/dev/video0. Kiyo 2-2: 92 on /dev/video2. Both clean, dmesg.post empty
of fatal patterns.

So Intel survives both reproducers in the windows tested. Doesn't
disprove your "looks like a HW bug" framing -- consistent with Intel's
xHCI ring tolerating the cancel/resubmit pattern that kills ASMedia.
The cascade path is silicon-dependent.

Note on scope: neither test exercises the rapid-SET_CUR pattern
(settings spam during a video call) that triggers the firmware lockup
in real-world use. That separate trigger does crash Intel --
stress-test-kiyo.sh hits hc_died around round ~25 on stock kernel --
and CTRL_THROTTLE in the patch series addresses it. So the patch
series argument doesn't change.

Side note: the same v4l2-ctl focus_absolute reproducer is reported on
Linux ARM (Pi), Windows, and macOS by another user (Razer Insider) --
supports the firmware-bug framing. Reffed in the v8 upstream report.

For v8: CTRL_THROTTLE addresses the trigger (rapid SET_CUR -> firmware
lockup), not the xHCI-side cascade. The xHCI side is your territory.

Forensics: https://github.com/jphein/kiyo-xhci-fix (raw run output
lives in gitignored results/ dirs locally; happy to send SUMMARY.log +
dmesg dumps off-list if useful).

JP

Jeffrey Pine Hein
Just plain helpful.
jphein.com =E2=98=80=EF=B8=8F techempower.org
(530) 798-4099




On Sun, Apr 26, 2026 at 11:36=E2=80=AFPM Michal Pecio <michal.pecio@gmail.c=
om> wrote:
>
> On Mon, 13 Apr 2026 10:05:45 +0200, Michal Pecio wrote:
> > Question: can you kill it by starting some video application to set
> > the camera up, closing it and then running this loop?
> >
> > while :; do v4l2-ctl -d /dev/video0 --stream-mmap --stream-count=3D1; d=
one
>
> Hi again,
>
> Any chance you could try it? And also the attached test program:
>
> cc -lusb-1.0 hammerint.c -o hammerint
> sudo ./hammerint 1532 0e05 0 85
>
> Initial arguments are VID:PID of the device, next is the number of
> an interface containing some interrupt endpoint and then the endpoint
> address (including 8_ if IN).
>
> I tried with a variety of SuperSpeed devices (UVC, NICs, hubs) and this
> reliably breaks ASMedia HCs within seconds. If the same is the case on
> Intel then it's a bigger problem than just UVC.
>
> The video streaming loop breaks even more controllers. I have some
> general idea how the streaming case could be dealt with, but not so
> much the interrupt one. Maybe rate limiting. I found that avoiding
> Set TR Dequeue to Link TRBs reduces failure rate, but not to zero.
>
> Long ago I also looked at the issued command sequences and I haven't
> noticed obvious errors or spec violations. Looks like a HW bug.
>
> Regards,
> Michal

