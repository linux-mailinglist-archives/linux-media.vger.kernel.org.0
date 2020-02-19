Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEF38164395
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2020 12:43:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726530AbgBSLnJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Feb 2020 06:43:09 -0500
Received: from mail-oi1-f170.google.com ([209.85.167.170]:33647 "EHLO
        mail-oi1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726491AbgBSLnJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Feb 2020 06:43:09 -0500
Received: by mail-oi1-f170.google.com with SMTP id q81so23533467oig.0
        for <linux-media@vger.kernel.org>; Wed, 19 Feb 2020 03:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=Sf3xWKzTB3oAIkzHI0X4Bwt+pQrPEU0c8srEt8ISl6w=;
        b=eU6v25zv5SYHqs8PWRyU5NurTeEoU9b/a7AICgPbN6IC228trboPsnPDAP7O4odspX
         xqzWYeZN8Mypp14KGjg1ZuMDyL28f/1YsUsDN8CGgdADZBwCSHx5rLrsIf6IVja5KqVU
         /ORFJSoxYAAmVkDfWXn0HPE5XKfdmQ1yt06CSMwo4Q5Db2F+J0witOOedIdF0yP9XkKx
         TlBmxiXuYQUDa5LN9lDrXRmh6zDG/tCrhqkH4ee8sSUJMwPg2uQ7S9xzKIGwiAfD9Ucn
         auNUwSvQFkypKtFrRqlSmS2F/jE0UupuA8YvOUGfnvLGIsUdcCTX1o0T/qyxPXjmZwl9
         RqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=Sf3xWKzTB3oAIkzHI0X4Bwt+pQrPEU0c8srEt8ISl6w=;
        b=V1MvGmCz1S/KufKgiORBfVloqLcyGb4rq3eCWXjYPfN5AeALYgdNjYGwFYKOcT25gv
         AfzHXCkqa8D1MWawbuGIN9jZKBpN6y/y7tBTnzD27HsnWoUk+nAaIpH2+igrAaZLctY1
         D6mEmpenUGcXHL84Hu6AhxdndAX+4yycIMTS3gVvODOpO1fpS2RBmm9ZGuSoujKFOFMl
         eE12ExVQjbn43yfGqnSLxgLBIJcpyjt+cU2BNLa3MpoSbo2jKDsf/HE+DYIUpvH1WFq/
         t1cfa/iimxQnySWz/ox2o8rOEtTQKyZLl82fSAUnRAcCrha4LiDqdtBhQXzuH+hXNeRO
         qGaw==
X-Gm-Message-State: APjAAAUDMgVri/fBCPKvxpQblOY9XeJoGKeMHIh9VrxBkLsVZcOapECY
        uKIHDRP5WsxNZEoA9oTpCfuHhcweBfkRiREWkPQ=
X-Google-Smtp-Source: APXvYqxpTt8fEllfnWBQz/Mx60e23WbatuaMhFtL0QTUXp0LZdrAj7D3836omVHC0YQ4Zp40XqC+zsBDRs3+O/aWNfc=
X-Received: by 2002:aca:2803:: with SMTP id 3mr4179270oix.162.1582112588890;
 Wed, 19 Feb 2020 03:43:08 -0800 (PST)
MIME-Version: 1.0
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Wed, 19 Feb 2020 11:42:42 +0000
Message-ID: <CA+V-a8tnsxJP2CfwgrkPum6mYQEEP9+0=Fap4dFu-3x+fXdadw@mail.gmail.com>
Subject: [Query] : DT: Adding mezzanine board
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

I am working Renesas RZ/Gx platforms, these boards have support for
connecting MIPI adapter mezzanine board [1]. To enable this support I
am planning to create a dtsi which will include the board file and
enable the necessary VIN/CSI and the camera endpoint.

For example: to add support for G2E board I would create a file named
r8a774c0-cat874-mipi-adapter.dtsi which will include the board file
r8a774c0.dtsi and enable necessary VIN/CSI/Camera endpoint and when
user wants to enable this support for the G2E board he could just
include r8a774c0-cat874-mipi-adapter.dtsi to r8a774c0-cat874.dts

Would this be a good approach or is there an alternative way which I am missing.

[1] https://github.com/Kevin-WSCU/96Boards-Camera/blob/master/AISTARVISION%20MIPI%20Adapter%20V2.1/AISTARVISION%20MIPI%20Adapter%20V2.1.pdf

Cheers,
--Prabhakar Lad
