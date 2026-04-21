Return-Path: <linux-media+bounces-59185-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOgVBqjR5mmz1AEAu9opvQ
	(envelope-from <linux-media+bounces-59185-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 03:23:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F126435409
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 03:23:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B42C2300CC2D
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 01:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C96F2459C5;
	Tue, 21 Apr 2026 01:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BBVe641u"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBAA1DB356;
	Tue, 21 Apr 2026 01:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776734615; cv=none; b=rgDYuekk5ccA44BYZQipKUiw5coMOvP3qejjRzlIt3KeCI0Z6Y2s2//QsezLmqVmfsu/IMeXm06Udh9qnxDsqkMygehHh8Md3T9qG+LzUfOzR+PgdD1xQ7VX8kVbYiuUGBWwH0gU8AoKdRQaqHkh9YtQEqKCLKDJCzGtISBTGAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776734615; c=relaxed/simple;
	bh=e1BrCqTnesBf71s0tW30cIOodf3LkEmZ7dvipoEXL+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f5twsl2ucAmhCYaLZ3jYx1a1eLBpoCCY+s4GtYHl8nxwTWnvAao72o43WThg/dXngIJbn+E2CfrHWvI/YTK/Rf5yRjuZGHCm89hCDsruDV2/GtNi5Vk7fJ0oFjn4AHNbnhSxpFZMvEYNoar3gek8wViIqIZZshLfnE5rj6ThkK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BBVe641u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7AB7C19425;
	Tue, 21 Apr 2026 01:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776734615;
	bh=e1BrCqTnesBf71s0tW30cIOodf3LkEmZ7dvipoEXL+0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BBVe641usc3KetDWvfNA4wXAJjdGn/s9lUmgl8oq0FNTe+EnOxGT/LABSzok67/t+
	 v8tB+SDtea5eIC1c7zCCxxWifqNyTBW6uhV1mbpXFcxoM+TJzXgWkDVvs7OkrzKl1C
	 kVkeApzT3Gcirvvt1s+yWpj2R7zFzCt0fI78GLPqZDkMB6S/iyzcyhQt3pCVF25khf
	 JbvqMczgoCi5ltn0Zw9a8EZDxWbEAPgYEzVEI4da1095KXxrT4PhEXDJXfN6K7Aw+c
	 UDoddAXHXTWIWG8y27nF75te6SuHBXeSTwSSfnm0P012QD9lR0mOtX06X207lXhRN7
	 kYlsY00jsM9sA==
Message-ID: <148e8b79-25d9-471b-b3ac-35f944aae927@kernel.org>
Date: Tue, 21 Apr 2026 02:23:32 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: venus: declare firmware files via MODULE_FIRMWARE
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <5RSTHU5_nsLp9gy49GbhT_8mHBjtBeKDsC6F1ABHCU9ZdpW9A8692UruVYnsCexIJGWsWiW2R5WtPULge31Gyw==@protonmail.internalid>
 <20260419-wip-obbardc-qcom-venus-firmware-v1-1-08a0d3cf056f@linaro.org>
 <b18d5f20-4013-47a3-bf43-06162682a65a@kernel.org>
 <5eH-TLTol5AO_JnG_lVOVn4jVL8Y9hFrmS5YgPznDbZXibbSfmVS2QTPl5TJT1IQ7ib7mfdqLz-VZSlRRTy7Cw==@protonmail.internalid>
 <CACr-zFBV0p_61ZA6QDLXDqtUqnqajyqHhC9H2SFJ2kSZHevwVA@mail.gmail.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <CACr-zFBV0p_61ZA6QDLXDqtUqnqajyqHhC9H2SFJ2kSZHevwVA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59185-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6F126435409
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20/04/2026 20:57, Christopher Obbard wrote:
> Hi Bryan,
> 
> The background for this was to ensure the firmware is available in a
> system image
> or copied into the initrd if the driver is built-in. This is done in a
> CI environment without
> access to the hardware.
> 
> Debian's initramfs-tools looks at MODULE_FIRWMARE and copies those
> files into the
> initrd if the driver is built-in. For now, a workaround for me could
> be to just manually copy
> the firmware into the initrd and drop this patch.
> 
> I didn't get to the bottom of modifying the firmware loading code to
> make the driver
> defer probe to when the rootfs was ready and instead just threw the
> firmware into
> the initrd, but that's another story.
> 
> On Mon, 20 Apr 2026 at 11:20, Bryan O'Donoghue <bod@kernel.org> wrote:
>>
>> On 19/04/2026 23:39, Christopher Obbard wrote:
>>> The driver loads firmware blobs at runtime via request_firmware()
>>> but does not currently advertise the possible filenames. Add
>>> MODULE_FIRMWARE() entries for all known firmware variants so they are
>>> visible via modinfo and can be picked up by user space tooling.
>>
>> What about the board dtsi files ?
> 
> I really am not keen on adding all of the firmware from the board dts files as
> MODULE_FIRMWARE entries into the driver, it then becomes two lists to
> maintain. What do you think?
> 
> BUT talking of two lists to maintain, I am essentially duplicating fwname in
> MODULE_FIRMWARE, so perhaps my argument is moot.
> 
> For my use-case, it may make sense to "teach" the initrd generator to look at
> the firmware-name entries from the dts files I am building for. But that is also
> not ideal.
> 
> 
> Cheers!
> 
> Chris

I think its reasonable to keep a list of firmware that is supplied in 
linux-firmware in the MODULE_FIRMWARE() list.

AFAIK paths such as "qcom/sdm845/SHIFT/axolotl/venus.mbn"; are not in 
linux-firmware so .. we shoudln't expect tooling to populate them into 
initrd.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>

---
bod

