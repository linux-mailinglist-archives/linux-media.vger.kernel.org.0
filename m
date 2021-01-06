Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09A2D2EC58D
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 22:12:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726508AbhAFVLi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jan 2021 16:11:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726505AbhAFVLi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jan 2021 16:11:38 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A783CC061757
        for <linux-media@vger.kernel.org>; Wed,  6 Jan 2021 13:10:57 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id l11so9853052lfg.0
        for <linux-media@vger.kernel.org>; Wed, 06 Jan 2021 13:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GGpBl0yr1msIhl7Jt4W/+SdeHokVK2A6MGaxmi/JOSM=;
        b=lunD786fXUFoQPBKI04rVJ8IOKiAQ0cKhjn3HBTR1gq3jju+VHUWba28AhG8PYfvhr
         8iW3K+ZDwGiElIWoJkzqR7SCrayAMRs+9l9xugYPJXQ299+1KacRGc6ZHJe2fE3XuwkI
         QNHQc7z/baXUIY4mDIQSPXXIcQDXCJFjgweyCaCSODRmAGr0IKj4QGJNskmHSQhrssgJ
         rDObcvzZT3DU2Sz5GfrorszmU4DHbOrBCFueKO6RSj+nVk7hcSVLKvMIXeu+bb/zK3/Y
         /11J6qlaUWHQ+M/ARWuB3uIeFZ+JBNiXvJyVDUOeeNtQ4ZCAv1cKX2Wi0thyWUgm2Wlf
         tGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GGpBl0yr1msIhl7Jt4W/+SdeHokVK2A6MGaxmi/JOSM=;
        b=H3wNafLj3hrstTqyjvH9wkogATgzdhFgD9P9QK745srLZ552N5rF6PcM4qBxDcYZSB
         TdGPzO+vTEte2tvBxN8Z6JYffW0/08+aRhO8W40Mi9DomyW+w1wcIlF5TDT5sK9urdVH
         2xv4hZt/RD2MKExEPkvZWnU/FP7QbR38pFAvKvH9yi7rhwjsCRKKMfd38f6ITsvSKNkd
         X1SplCBFRJSF+tmFyUqzIn5u+3OaWGiJEAfzkUy/TtvhvOefhMWYPDWYoEeurbpZyFZ5
         ScLs4piu6H4Om6njCAje0MoDIHs0LyKm+ivycgX5CrD+sfWOVgPKH7+JtqGuSGVyUHsi
         qxxg==
X-Gm-Message-State: AOAM530SjvScJBgbmp4SXUdaF2p1DnJyoGssQz11cFocSsPJSikQc3uo
        siGdgUOFuDYBRndVDaBkUeFQcnsy+U7sF53u+7Y=
X-Google-Smtp-Source: ABdhPJwOe/H8qwFl3eYhCPWCQb4CZwM+nZvLuucZGSxnBLERj0NQI2fGhuQZ9u+o7TEmxe92nMvUmDG8giipNIjwtHs=
X-Received: by 2002:a19:d93:: with SMTP id 141mr2713818lfn.229.1609967456131;
 Wed, 06 Jan 2021 13:10:56 -0800 (PST)
MIME-Version: 1.0
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
 <CAOMZO5CaWvRGV0Zc4AS6Uexh5uR5jkCG4MkEMkW-YU3NPOVg8g@mail.gmail.com> <X/XaJ0UA04ekdWpi@pendragon.ideasonboard.com>
In-Reply-To: <X/XaJ0UA04ekdWpi@pendragon.ideasonboard.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Wed, 6 Jan 2021 18:10:44 -0300
Message-ID: <CAOMZO5CkT1i3TMhC=VuZ4c3B6VnKX7jDj6wYON9VLMyQdDODKA@mail.gmail.com>
Subject: Re: [PATCH 00/75] media: imx: Miscellaneous fixes and cleanups for i.MX7
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Wed, Jan 6, 2021 at 12:41 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:

> Would you be able to bisect this ?

Sure, the commit the broke camera capture on a imx6ul-evk board was:

commit d2c66a98046a42ccb7d8a7b761a5dd6867815171
Author: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date:   Tue Mar 10 16:04:01 2020 +0200

    media: imx: imx7-media-csi: Disable legacy video node API

    Support for the MC-centric API has been tested on the i.MX7. Enable it
    for that platform. i.MX6 should be converted next.

    Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

If I use your imx/csi/imx7 branch, and then revert the above commit,
camera capture works for me (with the additional patch from me and Rui
as discussed in the other thread).

Regards,

Fabio Estevam
