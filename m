Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B96ED663F82
	for <lists+linux-media@lfdr.de>; Tue, 10 Jan 2023 12:50:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232906AbjAJLuT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Jan 2023 06:50:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238140AbjAJLtf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Jan 2023 06:49:35 -0500
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7745751332
        for <linux-media@vger.kernel.org>; Tue, 10 Jan 2023 03:49:34 -0800 (PST)
Date:   Tue, 10 Jan 2023 11:49:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
        s=protonmail3; t=1673351372; x=1673610572;
        bh=G+xykdRb1Ba6p/DeQ0KJEfvcYfrSs1EcsorORQzBThY=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=DS70BpXj98H7qtAXJMa2KeCHIdvvTgponGsuAwaw6mi8JrAw5x3PxwblY8CA+Rog6
         kpCEKtNOS7xL7k58aN2ERWW0uy3oGdsBoxkVyIS6822Ors+JfDpUpeNxfh3JER3m+B
         nt+Wo1laEUPnKVFgtoJQj/3FY5JhasSI8CoWXjcA7sx+vbREpsy1mgyt7GWNaAzFvu
         GSQ/Dv71KksPhEFoWrSuXkdqv8VX9W4x/IPEiygO9yknC2PQnEvTTi9ncRRilE2qJV
         9EuiIulHoz0DYabPrAHeDqgEOeBv8ZzasEWk/u33y35N9USRZJUfxTB1IGE1hYCs/7
         J6Wq63VxUjRyg==
To:     =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
From:   Simon Ser <contact@emersion.fr>
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: [PATCH] doc: add dma-buf IOCTL code to table
Message-ID: <CBxfX5V758BMJrTNNtWSrSxTq0Ep48B4PbOS-ryM5B-WDgErHc5zeJBDYNE9UwFVXDMSwd7Bj-Zu6PZZ2jnzGwcL1tHWYySujL9CgTTedoE=@emersion.fr>
In-Reply-To: <dea4806e-f96a-262a-e0d5-ae60c199458c@amd.com>
References: <20221128133853.355645-1-contact@emersion.fr> <dea4806e-f96a-262a-e0d5-ae60c199458c@amd.com>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tuesday, November 29th, 2022 at 10:56, Christian K=C3=B6nig <christian.k=
oenig@amd.com> wrote:

> Should I also push this?

I can push to drm-misc-next, but is that the suitable repo?
