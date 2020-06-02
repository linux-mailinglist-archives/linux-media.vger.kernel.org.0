Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3A6C1EC1B4
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2020 20:17:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726728AbgFBSRv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jun 2020 14:17:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726000AbgFBSRu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Jun 2020 14:17:50 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83248C08C5C0
        for <linux-media@vger.kernel.org>; Tue,  2 Jun 2020 11:17:49 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id t9so4553199ybk.9
        for <linux-media@vger.kernel.org>; Tue, 02 Jun 2020 11:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XO5zhh03cD8xcnE7YG3/0qATRVY10NIoznHjKKdiQLs=;
        b=V4aE8O7tPeCEWTFG/9ZitIb9tWUY1xODTnLRXthXMlQuWF4vL6wU7lZD81h+JJoCR0
         xvhR24EB0sZ5I7AlSx7VyNCoqZDsL46wfYL6wCpVUtOBKqmm5nNhckZe+kfFQ1R3122+
         LcuE0rlS77CWnyIrOEQuEOuZra71juQIswQoGVIWhjlZuZRW77tykBwtPjqG6Hz/YVA+
         lAAgVXsY3zxAtNDpi4PUaTr6HUtWW/aeF7TBfdSgdKk+uvQK8BDWz5I+7gy3e47J31fG
         43aQOmgnp0UkUSMqrwqWvrzwrCkGaqGji+Ww0ZoQmSdxM72ORfbur61zlloqo6hR4NGy
         +U5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XO5zhh03cD8xcnE7YG3/0qATRVY10NIoznHjKKdiQLs=;
        b=oVSTq2dZA20IEx3E72dv/mfX0F4y+2feu582ecZ2ynbW7H/BuCryOYM8WR8QyqV4Xe
         +8Un3LXvTfazqjZsfV5zGevjPAUH/8vmGx6iDUFT+Rz+nN/DF9KT6Xdbgs1DTUpDN70N
         oMIpeI9xsQv41cbU4E5+XfKBxYs/kOtjGhEPS6jPV+XqR71fDVPt7m50uC5IgKgYCt3f
         mELIB6Vx0Pqm3vpzrbsHvbG6oEkerDJu/pCF0TJQ2leEjI542Crdvy6CHnrjjfpHDVUv
         FT5XumzFrTj2Ii64mimBra3+lxV6pqXXLfngxACFQQUcDze31uqyz2J+etnfv3Ye95fQ
         /DTw==
X-Gm-Message-State: AOAM533F8U0I0iV4uGStm+Lhbk7opopTc9m36+t5ZPIHODGHBdmJCVra
        oxj/xGpWGacuTCL6HIpiLZBGtSX/YvyRM/ITWfNIA/Xw
X-Google-Smtp-Source: ABdhPJyvUcQzaoxP9Z7+NA0ayq3zt+AYQ/qtQiBSju3DDjPhcIvQogWwu9LOqruUSOLERNvMmPwP1B1X9R/Yr5Hmyvw=
X-Received: by 2002:a25:9ac4:: with SMTP id t4mr20795775ybo.356.1591121868222;
 Tue, 02 Jun 2020 11:17:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200529030012.254592-1-jnchase@google.com> <20200529030012.254592-3-jnchase@google.com>
 <CALTkaQ2OR+bc2QGeucA5aP3SiM5HLnx5=DoZQ51E_1d99Hb5Uw@mail.gmail.com>
 <CALTkaQ0NLgjS7H7De=7jy9jRG1xMFSbzdmxrFNerNU+o1rRzpg@mail.gmail.com> <d7e759d1-9bdf-0ab3-143a-f0e374667f04@xs4all.nl>
In-Reply-To: <d7e759d1-9bdf-0ab3-143a-f0e374667f04@xs4all.nl>
From:   Jeff Chase <jnchase@google.com>
Date:   Tue, 2 Jun 2020 14:17:36 -0400
Message-ID: <CALTkaQ3mq0iEPqSt92HVVkePRsUnuB2H=OZyp3O01jBSz=86_A@mail.gmail.com>
Subject: Re: Fwd: [PATCH v3 2/2] media: cec: i2c: ch7322: Add ch7322 CEC
 controller driver
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> > I haven't looked into the cec notifier mechanism yet but would it be
> > better to try to use that instead if possible and just ignore this
> > device's physical address detection? Then I could do more of a proper
> > reset in this enable op. But I'm not sure if I can properly associate
> > the device with an HDMI port on my platform unless I make some changes
> > to coreboot.
>
> I don't think this is useful: it's nice to have the CEC adapter do the
> physical address detection.
>
> One question about that though: if there is no physical address, can this
> driver still transmit CEC messages? Specifically Image View On. This is
> important to wake up displays that pull down the HPD when in standby.

Yes it can. I just verified this with the kwikwai analyzer.

Thanks,
Jeff
