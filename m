Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EABC682908
	for <lists+linux-media@lfdr.de>; Tue, 31 Jan 2023 10:38:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230482AbjAaJiq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Jan 2023 04:38:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230007AbjAaJip (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Jan 2023 04:38:45 -0500
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDEB5AE
        for <linux-media@vger.kernel.org>; Tue, 31 Jan 2023 01:38:43 -0800 (PST)
Date:   Tue, 31 Jan 2023 09:38:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
        s=protonmail; t=1675157921; x=1675417121;
        bh=ZtW85+pyEmBrvX9iUfUGtGRtneM+gi9bQFZSblafpow=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=vOvVK5DTzsroaJSMD5NGlV/jmHgQ+c3gz656acISejGf8TexRaPE2rALBjDM0Hr1K
         11Zv5w8d/9E+3pKP0KJevecfMmEA9KLY5to4oOkW1ceSQv6JfOiQ78esimLjOG4FNl
         RJItnBHiKv0psSzyAe6+HgkIVktiW3FlVgdLzVQgPxJiMIBoZn0WkxOVuPrVLhEndg
         RlefAalpRobhEq0UAFn8vJQvLD94qak5Zxy5wfrx8oWRiL2DRNSXMHtOLVPbsFx748
         CuuL7VyxqeoivlvRhS0oN5z20jjTsOQE/9twE0DE0BXGn3F9zYUuK6EuGIbaZ6Qov1
         QFGhdrsKx3WaA==
To:     Hans Verkuil <hverkuil@xs4all.nl>
From:   Simon Ser <contact@emersion.fr>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH] edid-decode: print human-readable CTA infoframe types
Message-ID: <Rj4A7e5tSJ7zioFAJFQUe7Hq0Kp9nTZoD2NB4PmZXcypO3_kRT_Rq8K41LnYqemW4fC7IQ7VBI3juHE6ohfHLQrL3lYmxtMdW71P8b-Z3ls=@emersion.fr>
In-Reply-To: <936514b3-8cff-2707-e4c4-92d795ec2a84@xs4all.nl>
References: <20230130172224.65193-1-contact@emersion.fr> <936514b3-8cff-2707-e4c4-92d795ec2a84@xs4all.nl>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.7 required=5.0 tests=BAYES_05,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tuesday, January 31st, 2023 at 10:02, Hans Verkuil <hverkuil@xs4all.nl> =
wrote:

> Can you show the type as well? E.g.: " %s InfoFrame (%u)", name, type
>=20
> It can be useful to have the code too.

Sure. A bit surprising since we never print the raw values for other
fields when we have a human-readable representation, but I'll send a
v2 with that changed.
