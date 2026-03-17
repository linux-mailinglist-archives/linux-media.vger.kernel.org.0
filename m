Return-Path: <linux-media+bounces-56059-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8AA/JQJIuWmK+QEAu9opvQ
	(envelope-from <linux-media+bounces-56059-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 13:24:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35ECD2A9C98
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 13:24:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8C6BF3021434
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 12:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 970283C140C;
	Tue, 17 Mar 2026 12:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PCQIUx04"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD8D3BF699
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 12:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773750272; cv=none; b=BJjuMXY+2go0sq4iRbg/GfoEjt8KEUiLjT+Z7Uen/ZuRzcwWcfhiNDvnBzaqq+8bXIFaNd1rX8GUfMuNN4wBlXD5PME4Tu25TyEmMnLX7axZb6IIAWe/ICieXlYWykqwlarmpGAunkr00kz0XVpIhXjEAk2kMj5p5UcDTjcXMr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773750272; c=relaxed/simple;
	bh=zYeJewtSk2mzi1HsJtYZ+eRYb/Bnk8Du4yxceKn8ng0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=F/BmhMoAJvANQ7AdlWXeqWElQ4aktbpOTwMcF2Iyia5rrrn+AuC2oLjmhN/NPNlaAqvIuC1A0tIhQSjJWNY3xlBqeR8pxBnbnpoVW+Y6jebEiNJXX1szD0EAmZGb+m8KDarIiqLEwdcubeNMaOeQrG03QJCGtUgPMifFhnusFV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PCQIUx04; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10015C4CEF7;
	Tue, 17 Mar 2026 12:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773750271;
	bh=zYeJewtSk2mzi1HsJtYZ+eRYb/Bnk8Du4yxceKn8ng0=;
	h=Date:From:Subject:To:References:In-Reply-To:From;
	b=PCQIUx04qhSiDu/vlo6ykE+dme6zIsEWqmluwOuz2LMYF3mPacU4Vo4N5rLvnxpjT
	 jC1reStg7Iv0Bz7TfT+qaIgFJud8td04w3YW2M4k1CbegyCHRio73cNg+hsbmiTEyH
	 lfR1gT5bMVSjsqYIEKxhtyRdbBqMj59cSxOEusu0vF2odVVaALlFyJvGMRHcePM8Tv
	 SjpUgpkvwXeU4zl6szBuj35R99UWDv57mqaP5YuDNV0R8unM15umsvVSKMfsvwSNJ8
	 w+xsCJMVp4Z3O++ZFGbIFakxBvmPDdWUyT1/pBqZCSJsdbeNrA2g36dS5In/dS08Ic
	 3f7z2fnZw9NFg==
Message-ID: <4d8c5caf-234d-482f-a341-ff185dcb007d@kernel.org>
Date: Tue, 17 Mar 2026 13:24:29 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v2] v4l2-compliance: add tests for VIDIOC_S_FBUF/OVERLAY
 and selection flags
To: Rivka Bukchin <rivkab300@gmail.com>, linux-media@vger.kernel.org
References: <20260312081801.14353-1-rivkab300@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20260312081801.14353-1-rivkab300@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-56059-lists,linux-media=lfdr.de,cisco];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 35ECD2A9C98
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Rivka,

On 12/03/2026 09:18, Rivka Bukchin wrote:
> Add compliance tests for VIDIOC_S_FBUF and VIDIOC_OVERLAY to verify
> basic framebuffer and overlay handling.
> 
> Add tests for VIDIOC_S_SELECTION flag handling to ensure that valid
> flags (V4L2_SEL_FLAG_GE and V4L2_SEL_FLAG_LE) are accepted and that
> invalid flag combinations are rejected.
> 
> These tests extend the coverage of the format and selection ioctl
> compliance checks.
> 
> Signed-off-by: Rivka Bukchin <rivkab300@gmail.com>
> ---
> v2: Rebased on upstream v4l-utils tree
> 
>  utils/v4l2-compliance/v4l2-compliance.cpp   |  2 +
>  utils/v4l2-compliance/v4l2-compliance.h     |  2 +
>  utils/v4l2-compliance/v4l2-test-formats.cpp | 78 +++++++++++++++++++++
>  3 files changed, 82 insertions(+)
> 
> diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
> index 4e5c9d00deb5..20d5f329d335 100644
> --- a/utils/v4l2-compliance/v4l2-compliance.cpp
> +++ b/utils/v4l2-compliance/v4l2-compliance.cpp
> @@ -1464,6 +1464,8 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
>  		printf("\ttest Cropping: %s\n", ok(testCropping(&node)));
>  		printf("\ttest Composing: %s\n", ok(testComposing(&node)));
>  		printf("\ttest Scaling: %s\n", ok(testScaling(&node)));
> +		printf("\ttest Overlay: %s\n", ok(testOverlay(&node)));
> +        printf("\ttest Selection Flags: %s\n", ok(testSelectionFlags(&node)));

Bad indentation! Spaces instead of TABs.

>  		printf("\n");
>  
>  		/* Codec ioctls */
> diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
> index 4a7af5f5bce5..265cd08397fa 100644
> --- a/utils/v4l2-compliance/v4l2-compliance.h
> +++ b/utils/v4l2-compliance/v4l2-compliance.h
> @@ -375,6 +375,8 @@ int testSlicedVBICap(struct node *node);
>  int testCropping(struct node *node);
>  int testComposing(struct node *node);
>  int testScaling(struct node *node);
> +int testOverlay(struct node *node);
> +int testSelectionFlags(struct node *node);
>  
>  // Codec ioctl tests
>  int testEncoder(struct node *node);
> diff --git a/utils/v4l2-compliance/v4l2-test-formats.cpp b/utils/v4l2-compliance/v4l2-test-formats.cpp
> index 56b6614162cf..6c5743a3da47 100644
> --- a/utils/v4l2-compliance/v4l2-test-formats.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-formats.cpp
> @@ -2048,3 +2048,81 @@ int testScaling(struct node *node)
>  	}
>  	return node->can_scale ? 0 : ENOTTY;
>  }
> +
> +int testOverlay(struct node *node)
> +{
> +    struct v4l2_framebuffer fbuf;
> +    int ret;
> +
> +    memset(&fbuf, 0xff, sizeof(fbuf));
> +    fbuf.fmt.priv = 0;
> +
> +    ret = doioctl(node, VIDIOC_G_FBUF, &fbuf);
> +    if (ret == ENOTTY)
> +        return ret;
> +    if (ret == EINVAL)
> +        return ENOTTY;
> +    fail_on_test(ret);
> +
> +    if (!(node->g_caps() & (V4L2_CAP_VIDEO_OVERLAY |
> +                V4L2_CAP_VIDEO_OUTPUT_OVERLAY)))
> +        return ENOTTY;
> +
> +    struct v4l2_framebuffer set_fbuf = fbuf;
> +
> +    ret = doioctl(node, VIDIOC_S_FBUF, &set_fbuf);
> +    fail_on_test(ret && ret != ENOTTY && ret != EINVAL);
> +
> +    int enable = 1;
> +
> +    ret = doioctl(node, VIDIOC_OVERLAY, &enable);
> +    fail_on_test(ret && ret != ENOTTY && ret != EINVAL);
> +
> +    enable = 0;
> +
> +    ret = doioctl(node, VIDIOC_OVERLAY, &enable);
> +    fail_on_test(ret && ret != ENOTTY && ret != EINVAL);
> +
> +    return 0;
> +}

Just drop this. It's not worth supporting this, overlays are almost never used
these days.

> +
> +int testSelectionFlags(struct node *node)
> +{
> +    struct v4l2_selection sel = {
> +        node->can_capture ?
> +            V4L2_BUF_TYPE_VIDEO_CAPTURE :
> +            V4L2_BUF_TYPE_VIDEO_OUTPUT,
> +        V4L2_SEL_TGT_CROP
> +    };
> +    int ret;
> +
> +    memset(sel.reserved, 0xff, sizeof(sel.reserved));
> +
> +    ret = doioctl(node, VIDIOC_G_SELECTION, &sel);
> +    if (ret == ENOTTY || ret == EINVAL || ret == ENODATA)
> +        return ENOTTY;
> +
> +    fail_on_test(ret);
> +    fail_on_test(check_0(sel.reserved, sizeof(sel.reserved)));
> +
> +    struct v4l2_selection s = sel;
> +
> +    s.flags = V4L2_SEL_FLAG_GE;
> +    doioctl(node, VIDIOC_S_SELECTION, &s);
> +
> +    s = sel;
> +    s.flags = V4L2_SEL_FLAG_LE;
> +    doioctl(node, VIDIOC_S_SELECTION, &s);
> +
> +    s = sel;
> +    s.flags = V4L2_SEL_FLAG_GE | V4L2_SEL_FLAG_LE;
> +    doioctl(node, VIDIOC_S_SELECTION, &s);
> +
> +    s = sel;
> +    s.flags = ~0;
> +
> +    ret = doioctl(node, VIDIOC_S_SELECTION, &s);
> +    fail_on_test(ret == 0);

You're not testing anything in this function.

It would be worthwhile improving testBasicSelection() by adding tests for flag
handling: e.g. get the current selection, increment the width by 1, then call
S_SELECTION with FLAG_LE: the result must either be the original selection or
the original selection but with width incremented by 1.

I think a lot of drivers probably do not implement this or implement it poorly,
so new tests would be welcome, but this code isn't useful.

Regards,

	Hans

> +
> +    return 0;
> +}


