Return-Path: <linux-media+bounces-67406-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cfQQEWmVU2oqcAMAu9opvQ
	(envelope-from <linux-media+bounces-67406-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 15:23:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B7807744C84
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 15:23:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=googlemail.com header.s=20251104 header.b=UIryAVSg;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67406-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67406-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC0853025937
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 13:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31E463AA9CA;
	Sun, 12 Jul 2026 13:23:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843921A6807
	for <linux-media@vger.kernel.org>; Sun, 12 Jul 2026 13:23:42 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783862623; cv=pass; b=YzfWXqxYAhQfBO6DeXjsiU+GUR0oxJws8i04+XclmoB1JxFwu1YdK7+OFfWUao3x/Wc2BkoN+E4zRm+r2+6j+rbWFuGbayokdPQuiORUMzOdprd6neJdPK5NVN3mrwR8OO3ZAoHuwBuxWLT0WM5Lz+UlJHSLeebXftPsGH4SJCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783862623; c=relaxed/simple;
	bh=lBMLQxEd7BYJd8Kkqj4N1dnnSWNKtFYutuFtvv5S2hc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DXofthUjgr47jXB4BzKWpCW0pNszN7+HIbRYDGrun+80AhPckjzTM9Wd9GYI3wsIlC066A8+TrE1R1ImmwM65Qxc6MHoU73fu4UIOV99yEXLQ9pW+rG+a/VBzdNbV4AKzFSmCzUhr+y5dMh2ZMb6dusp6TGgE2Gw/+6xxqvN630=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=UIryAVSg; arc=pass smtp.client-ip=209.85.214.180
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cacf197759so33950445ad.2
        for <linux-media@vger.kernel.org>; Sun, 12 Jul 2026 06:23:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783862622; cv=none;
        d=google.com; s=arc-20260327;
        b=DC38/+ZG3lEeUSFLgPItgvEzEmlqTpo5DcLmqUcgGBYYAsBk8yLYMFC3CoU9kB6d5w
         w57mwDQoZCl2ksbcNIj3ldG7HuZtc0SSZX28smNjRu+kXNsyVndvYN0Lv1YyIO1on4kD
         fpaPkoXjBlVddCgeWzR5PDIb7DztXSccRJlHOAGg0BQ1buPOEsbx3G/W++qvtgsi3rmL
         JrKYI9BfUIpeCykZP5tdy1//cb7baxd+3qBE1VT3MUd3mNTuivz6li4CtL1cSgnpgzac
         vcoPoKKuw17MeO0dCxzJuF1XveMTZeeupBYio5KICgKZB04jjoHhJlMuWgh+g26gjBNy
         SEHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lBMLQxEd7BYJd8Kkqj4N1dnnSWNKtFYutuFtvv5S2hc=;
        fh=wCpd/kC/AdvxlHTpdTwwNSx4ZEkaXBJaQE3MdRQPLn0=;
        b=ozku51JrBnHP5DTptP/qXEErgvKUWENZfWHwSjswITjeSp8vRx3qDU02xDQBH0mvz2
         9m3dWa5B3U+Fx8Yt0qBZd8FbEZnCUmzc/Rkiq9gjDv1yF7GlG6L/s10M4SThi/czRd1B
         OWG2HEvhJWULTeb/yLYkysa+KsMlNHB2CHuYoL1qYmGAZeKP5HMErX0i9gG96biD/XR3
         8ybp5xENT6Qt1ccYeGpeGpDj8oA9lrUF25K2+aOKfSADJUCB9c+9JC7KLaRz2S8Y95wg
         UoI8QcrQmmdfK1PHM5Z45GqfN1KaxN+FnaL6VDxkXBXclRhC2OnbVDUgnBSZY6SdZ0dA
         SrwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1783862622; x=1784467422; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lBMLQxEd7BYJd8Kkqj4N1dnnSWNKtFYutuFtvv5S2hc=;
        b=UIryAVSgAe62zyOOdz/CjWDn4qmJtVJpT3RQKd41jEBfazaOhjqhuEE7usJpT2NdJF
         M1KodVMMNotVUyoFRhHwjxzDglfO1Xo1egNWdpGLVoIYYEsO/bWYNn/Vo1pDOpw6/59j
         SoCPm//MFjDWNk8UCpoXj/M4echGkrzH1W/yscNyY9gtqxjJTUzTN7yaZ1tF39owhiZd
         80FP4KiVl3aX5+Dz6NDmrbsxSO+HHgsdmNecIgf7kyjOH4YDpWMlgebcPz7aU+M5C3if
         70hbrG0nyl5EFpzFm8vZr625FHrTtag1Es15bsTGrj1os/7fG+hIdhpH7GzRRyeLUiR+
         XX0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783862622; x=1784467422;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lBMLQxEd7BYJd8Kkqj4N1dnnSWNKtFYutuFtvv5S2hc=;
        b=FItsGnamoTxFj7c1pfRo8EV68frWOfXf56sHBhijM3nS+1kcnM9lPg+Yt897iHXcA6
         7cZ9XuNr9GUIyd7kJ07aMSDXdjUR/pdghuy+vayZZZXyxXd7JZ/R74rP+YmyO7ITOQPU
         K4iVnAZfDmIBPNLRFGnezGXXdr5DlGAAXlzYOaF4EugtGmBGozKDrv0gRxP5Itg+OsT7
         8p9xEeLr5w7PftodIGmEzCNidBhBaax8VcSSeiBtboWQT/SKLq84Y/j5d+PFjFH0uOrH
         20cAF4qLl+p+meMmvIuMJNBWaBLzGuzidvsfE/jEf+RZ2wXHu28Ih56Sf4w1Kkta6UxC
         Ov4w==
X-Gm-Message-State: AOJu0YwtI35rZ2KEZI4bPX73kTITMJ7a+VoaQrNr2KD88UCyxqU1ULnc
	AgfJ20w7pKmCJONMND4jMISj8A0BpBfENB8PcPDxMozVHqeqFAYei+OH1upXYlHacXHu5FaMGu6
	M2wpLJuWFNX0SxFCbOAsci62YfCpsqkE=
X-Gm-Gg: AfdE7cknJUXw4+Y19JfH4cIizNQbl5gMHGzXynV0YgK3ZWoDJ6B8S8dXWF2MZQ9HQ5R
	1O05XCKmsD3JlQxAfB4vhBSxHJ98UrE86Ku505hPjZ1iBNz9W4qylqxtUTx2kIx1CrWSF4tabxk
	krwdq+8jPC2Lclnsg8MtYchdsf8g//VEe64A0V8g5+90QQMVEIIasM5r3ETpdD60NBR3f5p3vHf
	3F2b2enajGS0CJoWZPUMs2Qn3tqijBi5YJqCsJNfF+NwnRcJ/DZ5R52yHxrBL6MTbVmhy47I11X
	jBB1exFFfG2T7Ozo3Pzl5brzdSI9/g==
X-Received: by 2002:a17:903:240c:b0:2c8:1c05:16bb with SMTP id
 d9443c01a7336-2ce9ec0f108mr56548535ad.24.1783862621987; Sun, 12 Jul 2026
 06:23:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783673420.git.sean@mess.org> <a11dc2d089d4e288b63412a0d3029393c577ee80.1783673420.git.sean@mess.org>
In-Reply-To: <a11dc2d089d4e288b63412a0d3029393c577ee80.1783673420.git.sean@mess.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 12 Jul 2026 15:23:30 +0200
X-Gm-Features: AUfX_mzypuSkZEBJ20fubf7QLH9Pq4J2Gq3FfCadOdbOn5XOHaqqRDGX3eTeNBA
Message-ID: <CAFBinCAMtch=GJO8mba9zCj9KT77AuDSpybcuH9_1gu1i=Hr2A@mail.gmail.com>
Subject: Re: [PATCH 6/7] media: meson-ir-tx: Ensure rc_free_device() is called
 on unbind
To: Sean Young <sean@mess.org>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[googlemail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67406-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[martinblumenstingl@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sean@mess.org,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:patrice.chotard@foss.st.com,m:hverkuil+cisco@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-amlogic@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[googlemail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[martinblumenstingl@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[googlemail.com]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B7807744C84

On Fri, Jul 10, 2026 at 10:53=E2=80=AFAM Sean Young <sean@mess.org> wrote:
>
> Make rc_dev devm managed.
>
> Fixes: dccc0c3ddf8f ("media: rc: fix race between unregister and urb/irq =
callbacks")
> Signed-off-by: Sean Young <sean@mess.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

