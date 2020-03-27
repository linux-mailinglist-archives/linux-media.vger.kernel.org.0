Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08C63194DA7
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2020 01:00:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727509AbgC0AAl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Mar 2020 20:00:41 -0400
Received: from mail-qv1-f67.google.com ([209.85.219.67]:45726 "EHLO
        mail-qv1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726359AbgC0AAl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Mar 2020 20:00:41 -0400
Received: by mail-qv1-f67.google.com with SMTP id g4so4070606qvo.12
        for <linux-media@vger.kernel.org>; Thu, 26 Mar 2020 17:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=B1cbJ5t0R8UFJzXjhB07WkOzZd1rE012lQD1DP4BjA0=;
        b=jy0ZW8nurx5JIQ/7GXHvi3ghS4ycVNNtoKAgftbo829Cs3GqHvCydxhYb3jDWnW5GH
         EhWYKa7aCVUfPU9bl6my0nIO5PKQ86WzJ6SVNciMXbeVeZoQ+sJO+bFYWY3m7VV6fZ3i
         ZRTIKx3M2S6UfKbcJUO5E2BTIVX22uRXuaz675ptRQNqaXMthVXKFUOj/xglM08Rj5IX
         MB1+poVKAcIxzHVlWHGjIEXcmcbckwZlYwMtuw6oNp6t4Xc1jpq3cIcSUmnP4vlknRmX
         GtloUk2Rf1+0BtjKRgRsiON97FQFcUXk1ylPmomy7bajZM9lMfjwWSBGxqPJpRV9DTv5
         Pd/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=B1cbJ5t0R8UFJzXjhB07WkOzZd1rE012lQD1DP4BjA0=;
        b=OSdFiFEhu0waEKsWQW1PJIxoqbJrYZ9KHbUKL0tO0MqdNB/NWqcvRXcpKrGiFRdN9h
         DDd4aP9s5PsDzJ6pnJ2Z1WqCf0r4Ee1wcxRblp7wHIc+9Syjnxo1JIZVTFHRBb4y68EW
         W2DBHKjb6NEXjnAGDvXpCpir6kUpHYCdcce4nueLeA3MwcvKKjVxIjIBvsBdHVvwUH+D
         CCpMkASAKZiPk3TnUCFKRIuIydDu+uT+HvPfZ+svML4YnotaP3I4nmBOCd5BLnQcat+2
         RJh7K/OKCCSbGTDkxHCIvWVLirRAG2p08yCg2MK5TdeoUZ1/1FacU5VWtPCMo4AeTGK9
         Jtxw==
X-Gm-Message-State: ANhLgQ1j10eNkVliehe1PjfY7+1/dYD9uuY+8VsAFgXwX0EoQCZX71oP
        QE7/NyuVVyXfPTYZIWtnCmi3Xw==
X-Google-Smtp-Source: ADFU+vvh4mOat/Qc+DvsrHYwATNq6DpfS7/J/Bsrk8fJrHCcrVu4ajNZasDIa7wr3Kn9fwsoXb2tWQ==
X-Received: by 2002:a05:6214:1414:: with SMTP id n20mr11349975qvx.160.1585267239831;
        Thu, 26 Mar 2020 17:00:39 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (marriott-chateau-champlain-montreal.sites.intello.com. [66.171.169.34])
        by smtp.gmail.com with ESMTPSA id s4sm2690844qte.36.2020.03.26.17.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 17:00:38 -0700 (PDT)
Message-ID: <1df4b3c75ebef8001b2d47a8dbe1d688b4df0968.camel@ndufresne.ca>
Subject: Re: [RFC PATCH v4l-utils 1/1] Introduce support for meson building
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        Sean Young <sean@mess.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Date:   Thu, 26 Mar 2020 20:00:36 -0400
In-Reply-To: <20200325102654.GE4760@pendragon.ideasonboard.com>
References: <20200315205421.28797-1-ezequiel@collabora.com>
         <20200315205421.28797-2-ezequiel@collabora.com>
         <e7edde336329f8765e3801281bb91e07c754b2b8.camel@ndufresne.ca>
         <20200325102654.GE4760@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mercredi 25 mars 2020 à 12:26 +0200, Laurent Pinchart a écrit :
> > Custom reporting is no longer recommended, meson have a option driven
> > report (summary). The plus side is that it will be printed at the end
> > properly even if this project is used as subproject.
> 
> I didn't know about that, it's nice. The option has been added to meson
> 0.53 though, which may be a tad too recent ?

Indeed, but be careful with such an argument, since someone could come back and
say meson is too early, it's not over 10 years old yet. I think best is too look
at how often distro updates this library. If they only update when the entire
distro is updated, my recommendation is to use the version that best suite your
work. If they tend to backport on stable distro, then maybe it's best to be
conservative.

In GStreamer we do both, we stick with older meson in stable release (1.16)
unless there is a bug in meson that caused a bad build. And use the most recent
version in development, so that next when distro moves to a new stable, they
have to update meson at the same time, obviously for the benifit of their users.
(Also because a some upcoming meson feature are written by GStreamer developers,just to be honnest). 

Nicolas

