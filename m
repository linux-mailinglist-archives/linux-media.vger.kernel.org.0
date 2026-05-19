Return-Path: <linux-media+bounces-62138-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOtkHJFeDGq5gQUAu9opvQ
	(envelope-from <linux-media+bounces-62138-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 14:58:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E33FF57F2D7
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 14:58:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 06DC2306FFF9
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 12:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F56C4DD6FE;
	Tue, 19 May 2026 12:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AhudaEwd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEEC4C9576
	for <linux-media@vger.kernel.org>; Tue, 19 May 2026 12:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779195104; cv=pass; b=RE2OwLfPK73LDyQb7N0dA8Gbu1pkcWZclp1+YIILf0oEY/662fgv8uwguUTJ5VIhO8xdlnoVmZoP4xBlXV1RVk3DP9s0YeUxyRInNLiN4GDO0XyjA64zIGv87QaEMvjXV4yYcH4lkvKuQills4Smm1Y1LxRyXYA53zoo0BqCupw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779195104; c=relaxed/simple;
	bh=4j8eKvdYW3TO/2TB5hSdezKwnL3kRYtsMEXxX47lq7I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pJ1yEMcte+YNsPxHtoWgIisZ8XGfSRbu/p45owzWFiJ7i0uFWlkK/wWU4jLH+I6rPFzfcRcdA02u5ZhTJSd1JjoAfUH/oFGYJlSGX0+cD9S7nrQ0OTeEsfloxZbn4i9K3G+ycUsvPysI3SV/POTS/Q8xkhci6Xi9CS5WtbvX28c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AhudaEwd; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-65c24be9e4bso3681064d50.1
        for <linux-media@vger.kernel.org>; Tue, 19 May 2026 05:51:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779195102; cv=none;
        d=google.com; s=arc-20240605;
        b=CW1vjmw7ww66ghLz7evWiVm0CClIMaSnnTUMy0OJ7Bn8ZN7hW0TeV4nEGzIcbYwk60
         yegzjDEOx7aq90f1YFdyKlXLounwviMfNQX7BM9P8njQtGCD7GJf5/dg9BbGvikz7bfa
         NrzLLwuzPkW62Cec/9w4RiIQjE/iWG1a5YNWUOrhKOOQzLd8ba2rcQPXijvGxvzqtxVL
         gXN2QHlGpyPtCzwgzulcdxbiUwDAg/c5V0wg70Omqek2QCQaTNdLEBRTZCkQPlVwgd5k
         9T1xIzVJunnobIzCXaaFv2UOImpIVEnmPXHAPiADC2LK7pePYlhO5rc2Mtmg3l9SeyaP
         6pyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=34dwnoGdWl07HomanjfSe75hzG9FgBIN34Pio2tP35U=;
        fh=7SUREfSw7PKpNVBUD/vmDu11WCW2v8l6CizZhCbC624=;
        b=KKbBz+pxlTSB894033iKVY3CJmpofyRCbk6NZZ1mAXqZr0kduwYxIlCOrTQZt6mMc4
         zqlqs2WIUohY/9RSwocOnmfIqVbdxb0pJ7vyXOyRcu6oFf40WoAkXef7iZ6aBZ/XeIyX
         YmHGyilQHJzT0HZJD7pjzg6cYoIU1VFqE0fNvG1RiZY2ijiHj4fCzeVaByYRcQCFrAPb
         GVka1Got/TXQ5mYx44RZRRqSPaITFDXaPcUByWahelAl0W4HFBTuVcM0LhtFAp1Xh6FL
         n6OhQzQgFp9LvNWPnjjsKeQfP4rmNJQrD05fzxAWz+S3oGh3el2yW+6NjmMGPDUeCG+h
         0GwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779195102; x=1779799902; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=34dwnoGdWl07HomanjfSe75hzG9FgBIN34Pio2tP35U=;
        b=AhudaEwdHOfdm4bFnhwnYpo6/f/sgq9JjxaahzVDUKqX3O0oOO5twciWxwPAq3Zw3Y
         gXlcHWvbPedEm8lu9OXZCiQuZWrveTZMgbHTz+nmZ+lmVng6UJOQVS4pJDnx3GaAX+fJ
         I/LK/8bzzXkL6xEkwA4+X1jAs/xGGX2GyTRWNTDvUwyjXUQbJun+eqQBJOSO6I2Y5ZTu
         CU5nzb0SEzOEnVb8J3M2PCvR209vnVglc+I4ENLnSqX2H3Y14sp4FxU06j3CB9GDwZxX
         ztQmJK6QUZf7S1zIkpZiWrmn/7GsDMCoM4+yykrbblbM6/HgCfTsSAhoXgnf7/YfOT1i
         F/Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779195102; x=1779799902;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=34dwnoGdWl07HomanjfSe75hzG9FgBIN34Pio2tP35U=;
        b=dpasSsHDaxGhVIyJLfhq1TqhXmn/C29e2VD7qynaPqb+BTN6sXJ9z6pwTrMDpFJHY4
         sLZIQZ4xO3VTZi0Rjip6Zo/31BDhMp5/92DMvXF5FB/FcN2/e0QloWYlOSvS8GgfAdcK
         r6uBrc1hBqhzivpX/ANcWmpGXk2N6wqqqncDrxFXNnfWQAQxix5eQe4sSJ0Nzwf6xT6l
         OR6BR+xF3uSo2ZoBwuigcliCJs2fW5m/lGaF6CN1MfrQqjXQgjPTHmRL2l5zTLiLBvb0
         Mf0Rsxd4UZP9wmu7Nwp97rd2MgNyRn+DzIzNycynbOXbfZmVAuHh7PNPG6MA4zQZlf7B
         RLyQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Le8eD0R+Yfpne8wr19Zpk764OnzJTU2CIgBoURQ86BwS02xqk/FKjAV/CtL/65bBYcWRxVGKq188T4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJs5DhcO1bFctq0blnHl7p9r1RdOi+sXVGzAkqlYif5fDsx8W+
	ZEpTRnx9y8am9Z+lKkMVuWFZErfPOjnqDrZwqLv6g2zHnuhX17U8H8Vhq3ks7LVAnaOioQWhP+X
	uS4hDlTn1RU+tjyZRZYVvf/VhI9IkjHI=
X-Gm-Gg: Acq92OGLzTvUZurZXPx+Ailybo9VS41LExzecbiyXOuxDaTVpoDuqSxD/5xJL/FbirM
	z+XfLwMqBXs9vvIHS+KCG3I63JimHCPZUu7gpULnTDuewao/mf6TBf12EKbD4HW/IxcIijJZ8Kc
	GIsp0q2SckrSQETK1DATWOQ/qZsB5y0Ca6PbrDeIfH5AIVO3e/QShmtdqeQf4BCSACW/P+Lwghv
	xBrarOB3XZ0p/TCIcVuoHDyIVSakhsbM4Y0RP++0PSUC7HrVeRlS8BomFJq+obmj16kWf0+9MYD
	76PwQlpk
X-Received: by 2002:a53:acc9:0:10b0:65c:1df4:546c with SMTP id
 956f58d0204a3-65e2282ac4fmr15910523d50.44.1779195101747; Tue, 19 May 2026
 05:51:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <xMdPPQAJ2BbtNwnxmf1CN7FGbdhSJM7NIXkRCxzFvXv0g01tuvNPvAacsFJaDyBc3cIkIAEfi44ewZ3OGGAcDg==@protonmail.internalid>
 <20260519090819.1041314-1-lgs201920130244@gmail.com> <8787ea87-aa75-4fb5-a729-cd2b54d2ff8a@kernel.org>
In-Reply-To: <8787ea87-aa75-4fb5-a729-cd2b54d2ff8a@kernel.org>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 19 May 2026 20:51:27 +0800
X-Gm-Features: AVHnY4KqOt_44bY9beki1htG-4MqUrX2XUIpM9bTmjHAt2rVdqLTXUSsDESPn7A
Message-ID: <CANUHTR9g6vRkKfPeHBQ4_9YR-sZQ_UZBX3+8CiKPYp-XPcp1CQ@mail.gmail.com>
Subject: Re: [PATCH] media: venus: venc: avoid double free on video register failure
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
	Hans Verkuil <hans.verkuil@cisco.com>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62138-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: E33FF57F2D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bryan,

Thank you for the review and for pointing me to the mxc-jpeg cleanup
path.

On Tue, 19 May 2026 at 18:09, Bryan O'Donoghue <bod@kernel.org> wrote:
>
> OK so this will get the same feedback as the Iris version which is
> please fix the cleanup path.
>
> If we look at drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c we can see
>
>          ret = video_register_device(jpeg->dec_vdev, VFL_TYPE_VIDEO, -1);
>          if (ret) {
>                  dev_err(dev, "failed to register video device\n");
>                  goto err_vdev_register;
>          }
> <snip>
>
> err_vdev_register:
>          /* Only release if allocation succeeded but registration failed */
>          if (jpeg->dec_vdev)
>                  video_device_release(jpeg->dec_vdev);
>
> So for Venus and Iris
>
> err_vdev_release:
>         if(vdev)
>                 video_device_release(vdev);
>
> i.e. only release the video device on the error path if the vdev pointer
> is non-NULL.
>
> ---
> bod

I agree that the mxc-jpeg pattern is useful for avoiding a double
release when a video_device has been registered successfully and a later
probe step fails. In that case the cleanup path does:

        video_unregister_device(jpeg->dec_vdev);
        jpeg->dec_vdev = NULL;

and then falls through to:

        if (jpeg->dec_vdev)
                video_device_release(jpeg->dec_vdev);

So the NULL assignment prevents the already unregistered video_device
from being released again by the later shared error label. That makes
sense for the "registration succeeded, later cleanup failed" case.

However, the issue I am trying to fix in Venus happens before
video_register_device() returns, when video_register_device() itself
fails after reaching device_register().

The problematic path is:

        venc_probe()
          -> video_register_device(vdev, VFL_TYPE_VIDEO, -1)
             -> __video_register_device()
                -> device_register(&vdev->dev) fails
                   -> put_device(&vdev->dev)
                      -> v4l2_device_release()
                         -> vdev->release(vdev)
                            -> video_device_release(vdev)

At this point, video_register_device() returns an error to venc_probe().
Then the current Venus error path continues with:

        venc_probe()
          -> err_vdev_release
             -> video_device_release(vdev)

So the same video_device can be released twice.

In this path, adding only:

        if (vdev)
                video_device_release(vdev);

would not avoid the double free, because vdev is a local pointer in
venc_probe(). It is still non-NULL even if the object it points to has
already been released through put_device(&vdev->dev) inside
__video_register_device().

So I think the mxc-jpeg cleanup pattern handles a different ownership
transition: it avoids releasing a video_device after a successful
registration has later been undone with video_unregister_device(). The
Venus issue here is about the ownership state when video_register_device()
itself fails after device_register() has already taken and dropped the
device reference.

This is why the patch temporarily uses video_device_release_empty() while
calling video_register_device(). With that, if device_register() fails
and the V4L2 core reaches vdev->release(vdev), it will not free vdev.
Then the Venus err_vdev_release path can still release vdev exactly once:

        venc_probe()
          -> video_register_device()
             -> __video_register_device()
                -> device_register() fails
                   -> put_device(&vdev->dev)
                      -> v4l2_device_release()
                         -> vdev->release(vdev)
                            -> video_device_release_empty(vdev)

        venc_probe()
          -> err_vdev_release
             -> video_device_release(vdev)

After video_register_device() succeeds, the patch restores:

        vdev->release = video_device_release;

so the successfully registered device keeps the normal lifetime handling.

Please let me know if you think this should be solved differently, for
example in the V4L2 core instead of in the Venus driver. I would be happy
to rework the patch if there is a preferred approach.

Thanks,
Guangshuo

