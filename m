Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB49563BDC9
	for <lists+linux-media@lfdr.de>; Tue, 29 Nov 2022 11:18:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231184AbiK2KS4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Nov 2022 05:18:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbiK2KSy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Nov 2022 05:18:54 -0500
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 721E12A9
        for <linux-media@vger.kernel.org>; Tue, 29 Nov 2022 02:18:52 -0800 (PST)
Date:   Tue, 29 Nov 2022 10:18:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
        s=protonmail3; t=1669717130; x=1669976330;
        bh=3ruB+54vaggWqACqFh3bfr+P9VMe9cYDAJwDG7DhiIc=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=C2X1SP1kPW8xAUzgf2A1seIk4F5rUEJ6Whx/Ij2X0A1hQ4GZ1/MArMbn5L1xRq7UF
         lJ7zLx07qkbgcVHReGsI5QOSd+ZOsCFHS4nFY1u7QkkQPyS25CPWNJ6BbV7Qet/kxC
         +P565ozE3L9xSF5Yilxaf19XdQCSNkNVTUmsdwQ43bOKcqrsa82kzIOiHvtrU9D4vA
         S+CHE1TS9y3AJLVxCYpQwtn+uflUQwfGCCkaL3KzO2VjKhcIZxSQMPcEtfyTjHjc6u
         K9gl4ARrrTow+5bh5+ALb9Azx0bEyJwuxFRp4Fi5cjpGKysJWWHVwVqwGJ7bgm856J
         c3hf7eidn+amg==
To:     Hsia-Jun Li <randy.li@synaptics.com>
From:   Simon Ser <contact@emersion.fr>
Cc:     dri-devel@lists.freedesktop.org, ayaka@soulik.info,
        linux-kernel@vger.kernel.org, nicolas@ndufresne.ca,
        hverkuil@xs4all.nl, tzimmermann@suse.de, tfiga@chromium.org,
        linux-media@vger.kernel.org
Subject: Re: [RFC] drm/fourcc: Add a modifier for contiguous memory
Message-ID: <sHR1F4GVsLkT7F5iPXtRNZMZ1R_vSHulae_ZqcpUXP6_u3t85f_JnERnKg5Pombd1gDlNi24rBVbeDGK6XddDTzyRPbipWsmRt78DDDl4o0=@emersion.fr>
In-Reply-To: <20221129101030.57499-1-randy.li@synaptics.com>
References: <20221129101030.57499-1-randy.li@synaptics.com>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Format modifiers are for the buffer layout only, not for the allocation
parameters, placement, etc. See the doc comment at the top of
drm_fourcc.h.
