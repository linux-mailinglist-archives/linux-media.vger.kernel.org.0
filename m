Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCFF6216DD5
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2020 15:36:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728188AbgGGNgV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jul 2020 09:36:21 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:54829 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727987AbgGGNgV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 7 Jul 2020 09:36:21 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 65B9A5C0246;
        Tue,  7 Jul 2020 09:36:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 07 Jul 2020 09:36:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=Y
        9Z9rGPnIh+duA366jGsOKkVre+U8IqnBxIciQcoucI=; b=VyCpMeTbXbU12wz63
        8Pv6X17fvOieh/LEuFI4uUjUcSeiSFYqckN2eJaxl/wAYE1zaXbHitO8rcTX6Awv
        DJutf5pgTpM+nRDokb6cjwIPeLHsmXiB0QQjno/BkofkVnmreBDO4QbHm5MzWssM
        iwOncrkzwQ1pWuQ6mB4RqV3JGpNzWNeu63Ua0SCQg3qVLGMPam1gZr7Jln12sxeX
        y4dSKi6Y8OlmcVmkxW3iBjgz4HFFIGKcSBPcdIM8BX3jaTMUe+eEmnqG4XnK0igo
        6I4MXf1R/c4z5rHczmfEO7TI4eYMETz2iQYLLaPP+dmhMNDF5B8hDql83xht8Ur6
        Gvi9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=Y9Z9rGPnIh+duA366jGsOKkVre+U8IqnBxIciQcou
        cI=; b=ZvNZq+OpXOvPqGJt8O1p8jJQaWx19gMjs8ZlvZFrisJfX+6kpZazluZ9z
        7ug8eCf8yT7jfIVcVG3+hrMRq3i6abaXnuCPfUI65OGN65fjDvzkYkFjVVeS7uav
        2OR1tlrubdtrGojeIBo+wbSuPhSK9RfAqbTG6uvp10hmJupGNf3rY5Wvg16q5DMQ
        WEZth0utuUCZ1sCYtnC0T35zIYdojKs/Df/AtHLQ6ePGYEpSfwtztZVjDxz9CmMA
        xKtcAgnkTvO5hEnIrJIV4oTgq3w+VTEU29Dn5lHI7zrHCyaH2+olZMAF5FVCHpqT
        I4S4nOUZ4ie9fThM5CUA7KILtZAFQ==
X-ME-Sender: <xms:VHoEX-ZYWJhgOlBZv2Zl41OOUBvm-oOGGC3kfizn3qHldAVIAIUpWg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehgdeiudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepgfejtedtjefggfffvdetuedthedtheegheeuteekfeeghfdtteejkeeludeg
    vddunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:VHoEXxaaeu0NXDJv1v9L-tmeifaKFu8jZ1yY_kmqymFGC7ZvmECR7A>
    <xmx:VHoEX4-3S1tVUZ-rLiLkX6Cmq5BmjRoB9KfXwrsZd_LJ5tZmg2PfWg>
    <xmx:VHoEXwoO32QY6o-Nd9v7devOUMInSPJT9e44TLNzAhY_0Q3OxhPhWQ>
    <xmx:VHoEX226KML4SYMhjpIOnZvmdqy7O6btcWOy1BKSR4467q9PXsBk7Q>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id BD48530600B2;
        Tue,  7 Jul 2020 09:36:19 -0400 (EDT)
Date:   Tue, 7 Jul 2020 15:36:18 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH] sun4i-csi: drop read/write, enable VB2_DMABUF
Message-ID: <20200707133618.76mndeqsoup7as4w@gilmour.lan>
References: <8bd3a727-f264-5605-906e-62aafbc76e6c@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <8bd3a727-f264-5605-906e-62aafbc76e6c@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 07, 2020 at 03:32:59PM +0200, Hans Verkuil wrote:
> For no obvious reason VB2_DMABUF was not enabled. Add this.
>=20
> Also both read and write file ops were set, but this was not enabled
> in the vb2 io_modes or in the device_caps capabilities. Drop this.
>=20
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
