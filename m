Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18CAE216D96
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2020 15:21:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726951AbgGGNV0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jul 2020 09:21:26 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:50789 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726900AbgGGNV0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 7 Jul 2020 09:21:26 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 512BE5C0232;
        Tue,  7 Jul 2020 09:21:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 07 Jul 2020 09:21:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=O
        5woqjW31r+xUUJXaDTZAQv37JGdpLetM3NmoBX1eUc=; b=m2k6zMlWBaeEpH6nY
        eCecCg3NschnJnE+gnzuq4feCrGzSJ30g1ID+AOTfs8Jvxd9k9VfzPugQjaGBUPW
        KQ3MyKXVefBrslSV/MEWXn3KIbSnOOpLNUrMVC6VffxzfwtJ1pajPGKp+IQC7FYw
        JG7Ln/Qd+Qe7A+zaI6QwvJHQB89PLJq3p3bSJ7+4U6QJfAOpWHhXRwVgPSePcpr1
        cLA9dDvswDB4ygNXUvh89F+VptkfXNHYZGuJqdckEnXd/OdRtGD+7M6+Eli131o/
        rcxFD1U7j/wFgLvi99aYguvkMjLQkow6GJWNzY+LMNpmQSOo88d35ZRi6bWFWCih
        12f5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=O5woqjW31r+xUUJXaDTZAQv37JGdpLetM3NmoBX1e
        Uc=; b=axvmMILo8HsaJ1RSJqZdhhlUMcnTKZ9DDaANx2yT/31WWn6aVwJyvIXCz
        hZdj6B+7hBeod87r55hFjKlrqXIm1ohMpf9nOBZ3Iw8WY1reVB+yr/5EKTfzpuQ2
        Vc2y6v80i8BIbBVR/9IMx8/qefvTsGln8qtUV1uUWqJsqD2RdUyFPfBvs5WdXN98
        WFEb60IRRRGMfTeprf6tUvVpA3T/itJrr57N9LmEEo6qXoFBajPPZDnm/PIJjLfj
        rGPuuMDTKR6HjCWylzMLvoYAnlic3PxNzqEMC/P1n65qXuXzp64LWZ+aptaBpJQm
        +d5qJ3YGuSBx1hoffpT/Fcdpi1Geg==
X-ME-Sender: <xms:1HYEX6L4Bq2FFcG7Qc2KKjgFBAOHqGsodrq2vbJEJ9rIV_ex63vnOg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehgdehkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepgfejtedtjefggfffvdetuedthedtheegheeuteekfeeghfdtteejkeeludeg
    vddunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:1HYEXyKFp-iM2kyoFEVYJcrMm4qTHgzHw6nybQG5cAtEUq_5axHDQQ>
    <xmx:1HYEX6uTqL9OVdnu2e5u-YRswyIhWXGlDM5Hk77_6DpmZSfhLhWA4w>
    <xmx:1HYEX_bt-b9rDJbMUHP1vafRejMrdA6nhGiuWo23koHkzDaNdiNbYA>
    <xmx:1XYEXz169tT1WFcQxFApmZpQURMb28oahobGDrpaW2A1wgDtir3qlA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 602BF30600A9;
        Tue,  7 Jul 2020 09:21:24 -0400 (EDT)
Date:   Tue, 7 Jul 2020 15:21:22 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Yong Deng <yong.deng@magewell.com>
Subject: Re: [PATCH] sunxi-csi: fill in bus_info of media device
Message-ID: <20200707132122.dnfv5lcysppxjbjl@gilmour.lan>
References: <94a6af12-23b5-435c-8604-6eedfb5aa41c@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <94a6af12-23b5-435c-8604-6eedfb5aa41c@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 07, 2020 at 03:10:15PM +0200, Hans Verkuil wrote:
> This fixes a v4l2-compliance warning:
>=20
> Required ioctls:
>                 warn: v4l2-test-media.cpp(52): empty bus_info
>         test MEDIA_IOC_DEVICE_INFO: OK
>=20
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
