Return-Path: <linux-media+bounces-64051-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id P3CKFYxXJWrnHAIAu9opvQ
	(envelope-from <linux-media+bounces-64051-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 13:35:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9607F650757
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 13:35:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=LlA9kTtC;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64051-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64051-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 628EB300E3BF
	for <lists+linux-media@lfdr.de>; Sun,  7 Jun 2026 11:35:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2921D388E5A;
	Sun,  7 Jun 2026 11:35:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AEFE3264DA
	for <linux-media@vger.kernel.org>; Sun,  7 Jun 2026 11:35:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780832133; cv=none; b=GRkjjRe/hdcbW2Gu+cyT9OBgAw4Q5HD/cX11rmVYhGIojRpKrbFVa4Y21Q0NFfBOuYPlAGwn6LAqgj0/WkHuUT8dwNpgzq9b0eiSkABFWvcDyyR1M7GrlooOvm2vQqTf5DanaRqYMdPce+SsBLDeziea1w2QhWR+InfI55lphYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780832133; c=relaxed/simple;
	bh=z9nV6o1CLjmQF566t7NPHTYxQDifWhN1JWM5637E3zE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cdZQLezFf7pT4oHGSrK5ld9yFS8kouZALJALey75eo7c7BQO8u+r9LtpeGxesV1AdidYXJfuACktqRXeFUr2dEczfEJfZ9xGaUjA0Io3Fn9gYz3Y+XDxeyJVTSwE0LIqGC1rDVrvlYVQ7F3fC+lZq+dvovr40TunIpQPBz0n1M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LlA9kTtC; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CF801F00893;
	Sun,  7 Jun 2026 11:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780832132;
	bh=ojRx6wp1adgvMqg+PJsGZn1wqIZ/W2+cHikg/UdbFGI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LlA9kTtC7B6Z2o8RzaINmtb/1N2eaV2bTJnX7KvIldYHko9LULJAMl7J0pTlVe0GE
	 Fv7WW0B3lXvcUFN1TAVXQtOB1NPiUp1oRp7xDsaer5CRkPrKOZgVG5fYssilCtSfjy
	 g40KEwOK7IG6q+q10EaufSIEmMbs6Yn2em9e2JIKrbCyt3ire9MgMRaIdjZ2MJE6EY
	 OQzBV56PaMgN37FXqwKalsae9aHfEAebMUPHl7yxGTQF7AHwqaR4wn5YFYhLWz2Lgq
	 2LHtg2Ttn5T0QeGip7+OjjZX5Jaaaxmap6NMO8LIAkTyFTc7AISeOIw0udpn3b9cPo
	 qU84E60Aj9lcg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] media: venus: Annotate flex arrays with
 __counted_by()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammed EL Kadiri" <med08elkadiri@gmail.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260607111933.6398-1-med08elkadiri@gmail.com>
References: <20260607111933.6398-1-med08elkadiri@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 07 Jun 2026 11:35:31 +0000
Message-Id: <20260607113532.0CF801F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:med08elkadiri@gmail.com,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-64051-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9607F650757

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Applying `__counted_by` to structs that directly overlay unvalidat=
ed, untrusted firmware messages defeats compiler-based bounds checking.

Pre-existing issues:
- [High] The Venus HFI parser does not validate that the remaining buffer b=
ytes are sufficient to hold the variable-length flexible array payloads ind=
icated by the firmware, leading to severe out-of-bounds reads during memcpy=
().
- [High] Several parsing functions return an incorrect consumed payload siz=
e, causing the parser loop to desynchronize and misinterpret flexible array=
 data as new property headers.
- [High] `parse_raw_formats()` calculates the total payload size incorrectl=
y by assuming all elements have the same number of planes as the final elem=
ent.
--

commit 475f2f7188ec43f866da689f1e919b2cf914c64a
Author: Mohammed EL Kadiri <med08elkadiri@gmail.com>

media: venus: Annotate flex arrays with __counted_by()

Add __counted_by() annotations to flexible array members in Venus HFI helper
structures. This aims to improve run-time bounds checking and compile-time
object size resolution.

> diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/med=
ia/platform/qcom/venus/hfi_helper.h
> index f44059f19505a..e96d458c52fa2 100644
> --- a/drivers/media/platform/qcom/venus/hfi_helper.h
> +++ b/drivers/media/platform/qcom/venus/hfi_helper.h
> @@ -616,7 +616,7 @@ struct hfi_capability {
> =20
>  struct hfi_capabilities {
>  	u32 num_capabilities;
> -	struct hfi_capability data[];
> +	struct hfi_capability data[] __counted_by(num_capabilities);
>  };

[Severity: High]
Does applying __counted_by() to the data array here defeat compiler-based
bounds checking?

Since num_capabilities is read directly from untrusted firmware packets wit=
hout
first being validated against the actual packet allocation size (rem_bytes),
applying __counted_by() could cause the compiler to wrongly trust the
attacker-controlled count.

This isn't a bug introduced by this patch, but the Venus HFI parser does not
validate that the remaining buffer bytes are sufficient to hold the
variable-length flexible array payloads:

drivers/media/platform/qcom/venus/hfi_parser.c:hfi_parser() {
	...
		case HFI_PROPERTY_PARAM_CAPABILITY_SUPPORTED:
			if (rem_bytes <=3D sizeof(struct hfi_capabilities))
				return HFI_ERR_SYS_INSUFFICIENT_RESOURCES;

			ret =3D parse_caps(core, codecs, domain, payload);
	...
}

drivers/media/platform/qcom/venus/hfi_parser.c:parse_caps() {
	...
	struct hfi_capabilities *caps =3D data;
	struct hfi_capability *cap =3D caps->data;
	u32 num_caps =3D caps->num_capabilities;
	struct hfi_capability caps_arr[MAX_CAP_ENTRIES] =3D {};

	if (num_caps > MAX_CAP_ENTRIES)
		return -EINVAL;

	memcpy(caps_arr, cap, num_caps * sizeof(*cap));
	...
}

This is a pre-existing issue, but parse_caps() returns the static header si=
ze
instead of the dynamic array size:

drivers/media/platform/qcom/venus/hfi_parser.c:parse_caps() {
	...
	return sizeof(*caps);
}

This causes the parser loop in hfi_parser() to incorrectly advance into the
middle of the flexible array data payload, leading to parsing desynchroniza=
tion:

drivers/media/platform/qcom/venus/hfi_parser.c:hfi_parser() {
	...
		words +=3D ret / sizeof(u32);
		rem_bytes -=3D ret;
	}
	...
}

[ ... ]

> @@ -802,7 +802,7 @@ struct hfi_profile_level {
> =20
>  struct hfi_profile_level_supported {
>  	u32 profile_count;
> -	struct hfi_profile_level profile_level[];
> +	struct hfi_profile_level profile_level[] __counted_by(profile_count);
>  };

[Severity: High]
Does applying __counted_by() to the profile_level array here also defeat
compiler bounds checking for the same reasons? profile_count is read from
untrusted firmware without validation against rem_bytes.

This is a pre-existing issue, but parse_profile_level() performs an
out-of-bounds memcpy() by blindly trusting the unvalidated profile_count
field against the unchecked remainder:

drivers/media/platform/qcom/venus/hfi_parser.c:parse_profile_level() {
	struct hfi_profile_level_supported *pl =3D data;
	struct hfi_profile_level *proflevel =3D pl->profile_level;
	struct hfi_profile_level pl_arr[HFI_MAX_PROFILE_COUNT] =3D {};

	if (pl->profile_count > HFI_MAX_PROFILE_COUNT)
		return -EINVAL;

	memcpy(pl_arr, proflevel, pl->profile_count * sizeof(*proflevel));
	...
}

[ ... ]

> @@ -1085,7 +1085,7 @@ struct hfi_resource_ocmem_requirement {
> =20
>  struct hfi_resource_ocmem_requirement_info {
>  	u32 num_entries;
> -	struct hfi_resource_ocmem_requirement requirements[];
> +	struct hfi_resource_ocmem_requirement requirements[] __counted_by(num_e=
ntries);
>  };

[Severity: High]
Can applying __counted_by() to the requirements array here lead to similar
bounds checking bypasses if num_entries is untrusted?

This isn't a bug introduced by this patch, but similar payload size
miscalculations occur in other parsing functions, such as parse_raw_formats=
().
The total payload size is calculated incorrectly by assuming all elements h=
ave
the same number of planes as the final element:

drivers/media/platform/qcom/venus/hfi_parser.c:parse_raw_formats() {
	...
	while (entries) {
		num_planes =3D pinfo->num_planes;
		...
		pinfo =3D (void *)pinfo + sizeof(*constr) * num_planes +
			2 * sizeof(u32);
		entries--;
	}
	...
	size =3D fmt->format_entries * (sizeof(*constr) * num_planes + 2 * sizeof(=
u32))
		+ 2 * sizeof(u32);

	return size;
}

Can this cause hfi_parser() to either advance its pointer too far or too li=
ttle
if the firmware provides entries with varying plane counts?

Also a pre-existing issue, parse_alloc_mode() returns the static header size
instead of the dynamic array size:

drivers/media/platform/qcom/venus/hfi_parser.c:parse_alloc_mode() {
	struct hfi_buffer_alloc_mode_supported *mode =3D data;
	...
	return sizeof(*mode);
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260607111933.6398=
-1-med08elkadiri@gmail.com?part=3D1

