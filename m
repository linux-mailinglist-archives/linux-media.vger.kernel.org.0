Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59CE1550BA
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2019 15:48:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbfFYNs6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jun 2019 09:48:58 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:38867 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726423AbfFYNs6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jun 2019 09:48:58 -0400
Received: by mail-io1-f68.google.com with SMTP id j6so711907ioa.5
        for <linux-media@vger.kernel.org>; Tue, 25 Jun 2019 06:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0GZB7vPzRz7lX9qbxkSEpP1KLhPlWAT4/FgiLzGhH+s=;
        b=r1rdcjeXi4MAwAvMD46wul0KccgFY0EgllO1e9xUMldteC7SW/pHDO3uvCrEiKmgGm
         aeFrfHq7saV5CRGC8Mz5umOUNpPmMbZXsMLqBS7ucu1YSLhevwBnGhM2FGo1ozCAQWR6
         1wnuRW3oW2HVeeVkRJXe3Y4aumn+LpEdPss5UyvBVSp3Q8TL/nislh28U3UKaH3uscsh
         7j4FlrKstl88AlccywZ5TdgX2fLFN7WMgqbGU5+7VAKnIYwNW7hrROX+njb6Cq8hz31c
         9++qX0i7JwQZB+cQp2yjIREQSQWyeGIyt/d9qm83GBBsgYTMzx/dtL0FED0FW4cjbL5U
         poXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0GZB7vPzRz7lX9qbxkSEpP1KLhPlWAT4/FgiLzGhH+s=;
        b=H46uDs2U1DwnltLU9LVFFymr+h5SNgYL3dJcbSDhKCQ5Hj7Zm79mUMCI0T6Iit2KMe
         SMQeYbr0+/vVIL0gFwKPznhzVGCzEOeMDzKp9VCahxuUJzSutibP9GZOx9luAnBu3CAG
         U1oDdv0jREH/oNN09bwLeNBjpUBtBOMrz8nko25ciO+WZkLmnB3yYygJlloKiRpn1NeX
         QuJfu5JZi10Ur12NJqSVh8W6iBbmAVCicwYgxz220abn0bxS0yKka9qmDLaK0hZA+ZxM
         8K/VOXQyhYrNsN+822Ux6voDqL+t/k5/DvfYoe0qr01f/cRfcr1CVeBEQjAA8aUV8xDm
         0V7Q==
X-Gm-Message-State: APjAAAWPwvSwAT+u5QrATYOSEXeeFcLuYG4uBruDvNS77biA907ftII+
        0H+dU8YpO/fIFM0KYbjW+AznU+FxOz/plocxPTmhSw==
X-Google-Smtp-Source: APXvYqxZXtosOMgMyOjQCcCtq+V7ie85OCZKFxgrYamt76zeQqFJw1tOsZ7F8w3e+47pEtLQnoEgW2aOruUNwGm/lSM=
X-Received: by 2002:a02:554a:: with SMTP id e71mr31810557jab.144.1561470537559;
 Tue, 25 Jun 2019 06:48:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190624160330.38048-1-hverkuil-cisco@xs4all.nl> <20190624160330.38048-4-hverkuil-cisco@xs4all.nl>
In-Reply-To: <20190624160330.38048-4-hverkuil-cisco@xs4all.nl>
From:   Dariusz Marcinkiewicz <darekm@google.com>
Date:   Tue, 25 Jun 2019 15:48:46 +0200
Message-ID: <CALFZZQGDAxTMk1uVVNwXZRVqsgLULmrCQF_BznpYL1MdSGgu6g@mail.gmail.com>
Subject: Re: [PATCHv8 03/13] cec: add new notifier functions
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Cheng-yi Chiang <cychiang@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello.

Some small comments/questions.

On Mon, Jun 24, 2019 at 6:03 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
...
> @@ -22,9 +22,11 @@ struct cec_notifier {
>         struct list_head head;
>         struct kref kref;
>         struct device *hdmi_dev;
> +       struct cec_connector_info conn_info;
>         const char *conn_name;
>         struct cec_adapter *cec_adap;
>         void (*callback)(struct cec_adapter *adap, u16 pa);
> +       bool called_cec_notifier_register;
If I read his correctly callback is set only by cec_notifier_register
(and not by the cec_notifier_cec_adap_register) so maybe that boolean
is not needed and just checking if the callback is set is enough to
tell those 2 cases apart?

...
> +struct cec_notifier *
> +cec_notifier_cec_adap_register(struct device *hdmi_dev, const char *conn_name,
> +                              struct cec_adapter *adap)
> +{
> +       struct cec_notifier *n;
> +
> +       if (WARN_ON(!adap))
> +               return NULL;
> +
> +       n = cec_notifier_get_conn(hdmi_dev, conn_name);
> +       if (!n)
> +               return n;
> +
> +       mutex_lock(&n->lock);
> +       n->cec_adap = adap;
> +       adap->conn_info = n->conn_info;
Would it make sense to use cec_s_conn_info? There is a certain
asymmetry here  - cec_s_phys_addr is used to configure physical
address, which also takes the adapter's lock while setting the
physical address. That lock is not taken while the connector info is
being set (not sure if that really matters for the code paths that
would call into this function).

> +       adap->notifier = n;
> +       cec_s_phys_addr(adap, n->phys_addr, false);
> +       mutex_unlock(&n->lock);
> +       return n;
> +}
> +EXPORT_SYMBOL_GPL(cec_notifier_cec_adap_register);
> +
> +void cec_notifier_cec_adap_unregister(struct cec_notifier *n)
> +{
> +       if (!n)
> +               return;
> +
> +       mutex_lock(&n->lock);
> +       memset(&n->cec_adap->conn_info, 0, sizeof(n->cec_adap->conn_info));
Could cec_s_conn_info be used to reset the connector info?
Also, we explicitly clear connector info here. Since the notifier
provides both connector info and physical address, maybe it would make
sense to clear physical address as well?


...
>  void cec_notifier_unregister(struct cec_notifier *n)
>  {
> +       /* Do nothing unless cec_notifier_register was called first */
> +       if (!n->called_cec_notifier_register)
Could this check be made with n->lock held? cec_notifier_register sets
this value while holding that lock.
...


Thank you.
