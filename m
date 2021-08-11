Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5D283E952B
	for <lists+linux-media@lfdr.de>; Wed, 11 Aug 2021 17:59:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233215AbhHKP72 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Aug 2021 11:59:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232847AbhHKP71 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Aug 2021 11:59:27 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D2F0C061765
        for <linux-media@vger.kernel.org>; Wed, 11 Aug 2021 08:59:03 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id b13so3787753wrs.3
        for <linux-media@vger.kernel.org>; Wed, 11 Aug 2021 08:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:references:in-reply-to
         :user-agent:mime-version:content-transfer-encoding;
        bh=FS2+3OD2ppHFaFnJCSkS1MTZs2RfqjvyHv8UDubusLk=;
        b=g4YTaePrwGwuU24ogZKf1KQPsxjyEIoJAy12wuXSA4PM0oMge5xfnscj2ULJb2Dg1C
         5fR/gIxO+5/kDDoB7kSd84pvjjijDfeK7BhXEn0kU1en8NdWY0RhImxG9ppH0V9OvwQ/
         thklirhNAEQ8BHRX4uXA4PHg9t4v/E52Mv8WP+Vhoj0FrxzYaTD9H7Xlw0SyG1TXecT8
         eNJ+wuDQxKBOQZDHlZxJMdRBs57YXgL8XYANV5RKReT6R+533KXxvCVFz6vAqsm6UkZy
         FRDhh/BOAUij3V6Snb1Ky7SQlhQWyMnnE1MfVY8AdZdCALA9HlQtYzrjIakVEKHTDEmT
         l1oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:references
         :in-reply-to:user-agent:mime-version:content-transfer-encoding;
        bh=FS2+3OD2ppHFaFnJCSkS1MTZs2RfqjvyHv8UDubusLk=;
        b=nGJilaMCA6W+qO5QRmK2kORf8/iCAduw40r0uenAEk/rD5kfwGkCaq3mUTDfaPdAMM
         H7CEaKedFUszvWW3YXrSOU4kfLRmZx6W36v3AUdRONEe1oAa+Zpbw8hXxFjiNek4XweN
         lNk+Zkob+5HJuXbcEAYcgSuaR3HZpCo9ZwWLx4IGTQE+zr9BAW+LUEYHxAEUjRYff94E
         eroLEl1dcsy+P302BOVreYWMZvjBX21+oUW/xAYA2It2QOHNwY2jyQa8/eZqgd0rNa6o
         dYC5LQg4Hyozjbmy6dzzhI2gYINTaAq55ksCpAc0qn2X8a6J1lhY/1tmDK/0yJtkIBy9
         ZXWQ==
X-Gm-Message-State: AOAM531Mc151/+8l6/zR6c4H2GaFdi9kib/xQFbxiejKqGWDEnsj0UBJ
        RRtcVNscQOPm7hYSJounPz8Qww==
X-Google-Smtp-Source: ABdhPJw9CBxnna6hBqxVI69el4dn7DN7K8mHQYzkwK8xqGHWwdzm4dGJQ5S7gIh5j1W72cRxwjNGyA==
X-Received: by 2002:a05:6000:18b:: with SMTP id p11mr8520835wrx.366.1628697541886;
        Wed, 11 Aug 2021 08:59:01 -0700 (PDT)
Received: from CTHALPA.outer.uphall.net (cpc1-cmbg20-2-0-cust759.5-4.cable.virginm.net. [86.21.218.248])
        by smtp.gmail.com with ESMTPSA id o28sm23469325wms.14.2021.08.11.08.59.01
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Wed, 11 Aug 2021 08:59:01 -0700 (PDT)
From:   John Cox <jc@kynesim.co.uk>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Daniel Almeida <daniel.almeida@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: Re: [RFC PATCHv2 02/11] v4l2-ctrls: add support for dynamically allocated arrays.
Date:   Wed, 11 Aug 2021 16:59:01 +0100
Message-ID: <cjs7hg9e457cn775prtsb860lkplvmmj9t@4ax.com>
References: <20210610113615.785359-1-hverkuil-cisco@xs4all.nl> <20210610113615.785359-3-hverkuil-cisco@xs4all.nl> <ccaf0fa9-8be6-c623-61c7-91cb804ca2bf@collabora.com> <123eee90ee3e3fe5227f6ed88defc3818645c83e.camel@collabora.com>
In-Reply-To: <123eee90ee3e3fe5227f6ed88defc3818645c83e.camel@collabora.com>
User-Agent: ForteAgent/8.00.32.1272
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

>[..]
>
>>=20
>>=20
>> =C2=A0I tested & used this on my AV1 uapi patches [0] and this feature=
 works just fine as far as I can tell.
>> =C2=A0
>> =C2=A0Tested-By: Daniel Almeida <daniel.almeida@collabora.com>
>> =C2=A0
>> =C2=A0Can this please be queued for 5.15?
>> =C2=A0
>
>Hi Daniel,
>
>I believe your reply wasn't plain text so might have been filtered.
>
>Also, I'd say we want to have users actually using the interface,
>before we consider merging it.

What constitutes using? We (Pi) are in the process of adding it in the
next version of our V4L2 H265 decoder (when we update to 5.14), or is it
only used once merged?

(Yes - I really must get round to trying to release our decoder)

Ta

John Cox
