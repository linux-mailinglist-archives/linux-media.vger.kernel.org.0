Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADBE81A0FA2
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2020 16:49:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729177AbgDGOtU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 10:49:20 -0400
Received: from plasma4.jpberlin.de ([80.241.57.33]:36797 "EHLO
        plasma4.jpberlin.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729072AbgDGOtU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Apr 2020 10:49:20 -0400
Received: from spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de [80.241.56.122])
        by plasma.jpberlin.de (Postfix) with ESMTP id 74FF2BCCAF;
        Tue,  7 Apr 2020 16:49:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from plasma.jpberlin.de ([80.241.56.68])
        by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de [80.241.56.122]) (amavisd-new, port 10030)
        with ESMTP id BlfSjxN4GkYL; Tue,  7 Apr 2020 16:49:03 +0200 (CEST)
Received: from webmail.opensynergy.com (unknown [217.66.60.5])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "webmail.opensynergy.com", Issuer "GeoTrust EV RSA CA 2018" (not verified))
        (Authenticated sender: opensynergy@jpberlin.de)
        by plasma.jpberlin.de (Postfix) with ESMTPSA id 0EC60B9CD1;
        Tue,  7 Apr 2020 16:49:03 +0200 (CEST)
Received: from os-lin-dmo.localnet (10.25.255.1) by MXS02.open-synergy.com
 (10.25.10.18) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 7 Apr 2020
 16:49:02 +0200
From:   Dmitry Sepp <dmitry.sepp@opensynergy.com>
To:     <virtio-dev@lists.oasis-open.org>,
        Keiichi Watanabe <keiichiw@chromium.org>
CC:     <linux-media@vger.kernel.org>, <acourbot@chromium.org>,
        <alexlau@chromium.org>, <daniel@ffwll.ch>, <dgreid@chromium.org>,
        <dstaessens@chromium.org>, <egranata@google.com>,
        <fziglio@redhat.com>, <hverkuil@xs4all.nl>,
        <keiichiw@chromium.org>, <kraxel@redhat.com>,
        <marcheu@chromium.org>, <posciak@chromium.org>,
        <spice-devel@lists.freedesktop.org>, <stevensd@chromium.org>,
        <tfiga@chromium.org>, <uril@redhat.com>,
        <samiullah.khawaja@opensynergy.com>, <kiran.pawar@opensynergy.com>
Subject: Re: [PATCH v3 1/2] virtio-video: Add virtio video device specification
Date:   Tue, 7 Apr 2020 16:49:02 +0200
Message-ID: <4320831.CvnuH1ECHv@os-lin-dmo>
Organization: OpenSynergy
In-Reply-To: <20200206102058.247258-2-keiichiw@chromium.org>
References: <20200206102058.247258-1-keiichiw@chromium.org> <20200206102058.247258-2-keiichiw@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [10.25.255.1]
X-Rspamd-Queue-Id: 74FF2BCCAF
X-Rspamd-Score: -0.13 / 15.00 / 200.00
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

> +\item[VIRTIO_VIDEO_CMD_STREAM_DESTROY] Destroy a video stream
> +  (context) within the device.
> +
> +\begin{lstlisting}
> +struct virtio_video_stream_destroy {
> +        struct virtio_video_cmd_hdr hdr;
> +};
> +\end{lstlisting}

Let's add more strict description to stream_destroy, like as follows:
Device MUST NOT generate any events for the stream in question after receiving 
the command. Before completing the command, Device MUST ensure that all 
asynchronous commands that are related to the stream have been completed and 
all memory objects are unreferenced.

Best regards,
Dmitry.



