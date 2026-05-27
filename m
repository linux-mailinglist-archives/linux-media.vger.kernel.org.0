Return-Path: <linux-media+bounces-62841-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACjzB9yAFmq7mwcAu9opvQ
	(envelope-from <linux-media+bounces-62841-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 07:27:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7AC5DF6FA
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 07:27:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC1F6303ADFC
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 05:27:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C73292FE575;
	Wed, 27 May 2026 05:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oUjCDmOO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57472DECBA
	for <linux-media@vger.kernel.org>; Wed, 27 May 2026 05:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779859654; cv=pass; b=rJN/Er8fOePtAD28xWOBso4twE1MBtqEq2LiPzSVdrBkxza1yik+Ee6DmSeGwvUIvckcb6AyZSUEWBdaCiliSeZMFz1yPaT1176V76TaRIGd4fBvrwjmC6TtdwLDo5muilaFEynStNy0aCRJVVHyBTRtNQM8lZhoD2xeNLljv90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779859654; c=relaxed/simple;
	bh=cxls03Gx0NL/K0IJ/azJa75evpNsWxLShOkwzxy04iQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MItTZzrk5Wkj/MEUI3O/I7C+ctTtX3rbLxTpBVhoVulMqvXLb3OWStN64oammAkhLVayBRCevZxGpwr1g75HemN/iagL7HywybB7QVCTxVPZuuR56p30UtvsJwy/PUiF0pP3+sOU5D5VwaFSewwynRS2GNJXzKPFMaSbs6upT7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oUjCDmOO; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-bcda7765d64so2195340966b.1
        for <linux-media@vger.kernel.org>; Tue, 26 May 2026 22:27:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779859651; cv=none;
        d=google.com; s=arc-20240605;
        b=iFQrv6A6OLgA1upv3tqR/+X20e4SpUVOW3I4ZWFoAuy1cT56sGo71SokdoG3OoUQma
         V+YeZO5M9vJIVGNwir/B8MwdO8OfjfQNHRa6D1y0x/9oitu/WKAiq0aeMtW4bVjNC4Rv
         VRDSSSWwUmhhrBrypPD5JHiLgoBQvvzHfewIkbQPw2D2fIr6ZDdD1BDmQ3JtoVBwl78Y
         9ZebwwiTTNSHgydCkT39X63rcpyeyxwISz5tSzkrngO3RBrQNI1646BohHImSjcbgoZ+
         1nIr7H/RMBuNqISOWFZd3gsTaGI+k98JL63Ib8neOXYGTFECb+KwFAsCn8J2CJmko6ZR
         lJ+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yeOMPaJvVCStq+rPePFEXjs4Ciky1rWly6VAPL5W1yk=;
        fh=nYicLOCqb3kCYwjicu6R5ByvnB9c3uUfmv9K5SO1+XQ=;
        b=Xlb73pJkXWA11Vyq+7UjeiAih4LPIzgjWzs8XaiNaVuIUo01lNs/M/kTH1FxOxiAs9
         hDv30SIzyIzAF4E8w9YopY9+zmaBSaC+CTnehqBIHKU8Ws1C+LwOusw0Y3lAIGSUSavs
         9D5K9znu6M/I/nx11iL4rIgPZpe8FHm5ExF/JIArJcx13vnM1dMa6X+dSrnKJyVuaeP/
         PHevuzQV4OD21zyQrKyarPNO2tPwyciNu83zVkpdffFjjmOiFbaUowRyzBKX6o08bv/J
         onvkRTbiZb+9iR6Kmk9R9+h8MWDw06/mO8DmaHL3JIg9qGFAb0j/jUvktbccwpmm6tCU
         i3OA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779859651; x=1780464451; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yeOMPaJvVCStq+rPePFEXjs4Ciky1rWly6VAPL5W1yk=;
        b=oUjCDmOOf95ZSkQpo4aYrIxZfrA1KYkmDrnaW2EyoDkH2oSq8kaO9+DXKqQY0kf5ku
         VvgKtr5g/dU9oeXl/Or5GxUMboV5feMRC9u7cqDqZmAV4igY7Kt17BpqXWrvYFBqIZps
         huiZeXDwMjVzDNcAXj+/0204Ne53Qc3yXgUpTGfnky00DorVeY8GodPV9kpWGh2svwIF
         /u1iTmhx/PVJNm9qwhPoEqOivo0pxtxe957WJGwpN/yfIMHw8h4HgcqG/prN5Q7lGWfL
         /H5Yb5rhHWZExLkkYlb6FiiXOj3yIgx8yjxU4NE5sCq9RchYBqT84sStyfliujuZrPy2
         7mVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779859651; x=1780464451;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yeOMPaJvVCStq+rPePFEXjs4Ciky1rWly6VAPL5W1yk=;
        b=G4rf+grHjs2Esy9piJ9Sqz/QBAfdVGUqVbmTcR6qWgB339wpdkgC+TeupiTj9ctaCX
         JgoPzWIPZiOyhGvWBCwqSeamQ2plC+J2r4DC9DUGxC/+MpxR6Bppbma0iSA2L9x1XT5v
         /L3Kbfd5N735317GeJJfZnUNKmtbYLmPTCi7a263lTOV4sLeWpyryjdINmNXTv0UDh9M
         DPNV3E1upICHxdSQqFNZGs2eNkrVBvoE1GkJyp2ZLrLd4MeZM5QyzIYhUQTC3y4C8nbL
         jwG8T4dvL+yyZ8Jgwc5ZrU8rs8ZDdTreQ+HLB48SE2WwmzDi3uXTl7OzVJUYkuKQkQ1V
         4VrQ==
X-Forwarded-Encrypted: i=1; AFNElJ8kprpFlMsirREIvDSGRp9vjCeqwpAs5WUlJzaaToO3CdIC5PSpoSB2i54WjIDm+igtt/X2nITZJTd/bQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzuu0AZVPeMdnJ+3TDWLKOtbz0YoWdx0KO5tOsBwNzbiSy574I8
	S/PNjoKxvp8VA0C+UX88/HACegx+mi43oWhkzPYJ232DnHOLjim2YS55NriELAaT3Y6KgoK/4QF
	RckHLD9f7eAuJKKIOYZVmz15I+YFDwy8=
X-Gm-Gg: Acq92OEvaoFBOIw14L03GHXbGGUXNL7A7a3A6w+Q3ZWFCTbzcErVa+DwuGgjzX6JkaI
	zcChFPNFOCNEAE85cxv/hfKNEBhf0ImpCxySps+BUSxu+/uWUlMLk05nK2CESbAmI6IGbUMszeP
	uRjt1LndFufj9owKFQrIWRyROaGogdnJ8zhWzD9+JLzokWL4rQldM7qNrrd9apg/dHIhUJeZnAz
	lRTTc9fecQ94cP8LvOZKZj9wJ9L3cMxnkrxeW68mHPsgM4kRp9f3QFUz6y1xOnHQuCE8iv384pe
	w8kw9KjaJFb8HcNZg8zf8CcGEIWfyf2iyB+KqnJmXeUEF31Qkxx1IDq93FjP6gZNM8874UH8BKx
	D8Er4pAztnGO4g1kR8zf5EmqLisArBg5kOCnEMhYlQ4TqEmG3PYJqUme1oATQPt+R1fEPRsL0KT
	ya1bsh
X-Received: by 2002:a17:907:9690:b0:bbf:bab5:ecd9 with SMTP id
 a640c23a62f3a-bdd4a09a7cdmr1107323766b.15.1779859650913; Tue, 26 May 2026
 22:27:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526200222.330280-1-jeongin.yeo@luaberry.com>
In-Reply-To: <20260526200222.330280-1-jeongin.yeo@luaberry.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 27 May 2026 07:26:53 +0200
X-Gm-Features: AVHnY4IX56ERP2tXIY5lOBi1rQdYTr7WKxxGTfNiBMqgwiTS-0PWmOJO-MZZzwM
Message-ID: <CAHp75Ve5Kntx5+mpr2hZCcFWda7GDUgME_G6c=1kRJJsYGt7eA@mail.gmail.com>
Subject: Re: [PATCH v2] media: atomisp: remove function name from dev_dbg calls
To: Jeongin Yeo <jeongin.yeo@luaberry.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	sakari.ailus@linux.intel.com, andy@kernel.org, matt@mattwardle.net, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-62841-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,luaberry.com:email]
X-Rspamd-Queue-Id: 8B7AC5DF6FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 26, 2026 at 10:03=E2=80=AFPM Jeongin Yeo <jeongin.yeo@luaberry.=
com> wrote:
>
> Remove the hardcoded function name prefix from dev_dbg() output
> strings within ia_css_binary_find(). dev_dbg() can already emit
> the function name via dynamic_debug's 'f' flag, so embedding it
> in the format string is redundant.
>
> This resolves the EMBEDDED_FUNCTION_NAME checkpatch warnings without
> introducing __func__ to format strings.
>
> No functional changes.

...

>                         dev_dbg(atomisp_dev,
> -                               "ia_css_binary_find() [%d] continue: !%d =
&& %d && (%d !=3D %d)\n",
> +                               "[%d] continue: !%d && %d && (%d !=3D %d)=
\n",
>                                 __LINE__, candidate->enable.continuous,
>                                 continuous, mode, IA_CSS_BINARY_MODE_COPY=
);

__LINE__ is also provided.


--=20
With Best Regards,
Andy Shevchenko

