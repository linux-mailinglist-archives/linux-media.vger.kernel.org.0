Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A548259A922
	for <lists+linux-media@lfdr.de>; Sat, 20 Aug 2022 01:15:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243413AbiHSXHm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Aug 2022 19:07:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236190AbiHSXHk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Aug 2022 19:07:40 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02580B729B
        for <linux-media@vger.kernel.org>; Fri, 19 Aug 2022 16:07:40 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-3246910dac3so158023537b3.12
        for <linux-media@vger.kernel.org>; Fri, 19 Aug 2022 16:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc;
        bh=/KBW+BzX2vV1CEJH0iXO7Z03r0qxUoUkGVUKMOGqEQo=;
        b=E+w4hNSYEaNnlUj9T9pJH6I6e7gHBsnDSnuBHNsYvmFInUEE1lQ4PeXqD/xy53DBb6
         wjBrG6+u2e/ntH4kf8bATDWVbPrFphHQ8l+qP1xyYOzXc44fgXiAhMKkkPb8vflcDcwk
         791vEGs1YhnjP/TlNm4tQFIo3z71FUTSZY7Ae733h1PLdR5UeGKEXdirnGBMSik0HRss
         kwc7oBpphQ8NOM0/z31CM2NnJ5qVxW3u6eYy5AlTVUHZVqyK95lpV41NsZs15bURmXkX
         CuMlCgz6sl+7QBKIw4TxxTdDebvrq2b0RHmelixnGhOG3HTtSVyGJxOxsc7j7aUHk2s3
         k/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc;
        bh=/KBW+BzX2vV1CEJH0iXO7Z03r0qxUoUkGVUKMOGqEQo=;
        b=6kqsZlhK/9t+L/FVZcEAHRQAaFHObmjfZ03soQnr7t/SEQ/ysxdkRsjBrWIv4ru4g5
         gkBZwmyPH5trkDRyhPpo5ccJXGeBUTZWAcUIzBUS4ufkIh4uTgOmz15xilvdMMi51TX8
         Bp+Cq5ALx+aswn2iCCDAySMNlAe53WAEqIndLHq3mlejg7z603b/3r8o+z3NnGBKKQY9
         26gABxi9k/f/qr/YhBruvFs16RUaASwwFBCpTBh+rK4vQJ5bZHwlRHzO5vWA/FNhmqlb
         WSES06HmB2qIm+5+9LoNiBPYjLxC7BPDjEvgBF+nO7y/HLWOllmrrIj1bcQnX33IxCrk
         6oEQ==
X-Gm-Message-State: ACgBeo0onk1KvYymKezCX7g39/4g3lU/7RXIrXfeIbB7vFkvkzLBxtrV
        hoUhessCqIXvRjfSxYj7xtlrkdu/jCpw2uxVenBNc0umlEs=
X-Google-Smtp-Source: AA6agR4hfqjnvzzAEE3KH4JOvo24tco2ElcDFbWFfNdhy/5C8oG4VEpPr0hMXTPwSilL8KfVIPOJrwZu9IzzVFcpx9g=
X-Received: by 2002:a0d:fac6:0:b0:328:a181:128d with SMTP id
 k189-20020a0dfac6000000b00328a181128dmr9891559ywf.274.1660950459081; Fri, 19
 Aug 2022 16:07:39 -0700 (PDT)
MIME-Version: 1.0
From:   linux guy <linuxguy123@gmail.com>
Date:   Fri, 19 Aug 2022 17:07:28 -0600
Message-ID: <CAJPRYeJ-G+BN4B76AqqKV6AKFj+TJw+TMtQZ2_PRdFeM7jf+kA@mail.gmail.com>
Subject: Mobius camera demux error in v4l2 ?
To:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi.

I'm having an issue using my Mobius camera in Linux.   A summary of
the issue can be found here:
https://bugzilla.redhat.com/show_bug.cgi?id=2107763

Is this the appropriate place to discuss this problem ?

Thanks
