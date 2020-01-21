Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92B00143F60
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2020 15:23:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729095AbgAUOWi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jan 2020 09:22:38 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:38098 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727508AbgAUOWh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jan 2020 09:22:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=hNw3DRuSsN/+zf/Zl49h7VV0ZiPu1Tu021gmftJRQdw=; b=FycJXymdB5MjMVTC5vkTTjZX6
        FEzn3y0JOalL5grFJ2jmg82olVkY94N1qeVnJIIdBh6eW3s29YClr/l7vaXJ9GJwhE2V8UOkh7AKJ
        o303ra0ffaF5gAtcHpDtz0JfhxnkcbKhqKeF4TozVRaDQyIq0/RyrSdolIWV6YBx8irQjOEYrC2Q7
        mkeebi1B0Z0Ko/fYXc0LzWrAIjt/+HjUgxqNxHlop4YdkzRwnvWYGq2FHIMASnUKUp15VeQulFMOU
        oa4jZx+4ApQG+0HWpT55VRNa5JEqFHd+fhSHusRNslq5FROUMorZccPyYws1Nfg0kr4v7rd3VNSDH
        BHnHcHB5Q==;
Received: from [179.179.33.167] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1ituQK-000888-OW; Tue, 21 Jan 2020 14:22:33 +0000
Date:   Tue, 21 Jan 2020 15:22:20 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Jenkins Builder Robot <jenkins@linuxtv.org>,
        linux-media@vger.kernel.org,
        LibCamera Devel <libcamera-devel@lists.libcamera.org>
Subject: Re: Build failed in Jenkins: libcamera #72
Message-ID: <20200121152220.0c869faf@kernel.org>
In-Reply-To: <aee7d434-3a1e-d6b9-7c9a-3367b1719587@ideasonboard.com>
References: <659134945.14.1579046596894.JavaMail.jenkins@builder.linuxtv.org>
        <263aa6e2-9b6c-5939-687d-005ae8fc2059@ideasonboard.com>
        <20200121141246.4d1b2ac5@kernel.org>
        <aee7d434-3a1e-d6b9-7c9a-3367b1719587@ideasonboard.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 21 Jan 2020 13:47:07 +0000
Kieran Bingham <kieran.bingham@ideasonboard.com> escreveu:

> So perhaps we should just add a meson --reconfigure to the start of the
> script?

I tried that, but it doesn't work. Wiping the config seems to be the only
sane way for this to work.

Cheers,
Mauro
