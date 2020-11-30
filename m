Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5322C2C8DB7
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 20:12:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727728AbgK3TL0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 14:11:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726063AbgK3TL0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 14:11:26 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99121C0613CF
        for <linux-media@vger.kernel.org>; Mon, 30 Nov 2020 11:10:45 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id k14so17704696wrn.1
        for <linux-media@vger.kernel.org>; Mon, 30 Nov 2020 11:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=mF8rdEcxcKIShDOdEPom9nQ7TChCjeVx5jqE1kripiM=;
        b=VUJkd3lQq7+k0eoIC45KF5X/bo6cix3YkpNIZNDtcyjflsapY5VzVC9m4fwtngCrqN
         I9Zt3tsAJPpmeOLrlLSPAhPod8sPg68cWVkmV4GeaJM3VyGNOGCBUJhFk0/xlh3jmt0y
         xmH5WvkarRjW5a9TnNGeonfcIcAgOz+EUyB+9dm224bwU6Qz7oiA21x0LcYVggWCWtN0
         BDLeAJ8P7K+7AVobFQECfc4C6//xz7tUsFkhYY8H9Qbem2s+L+dpMJOBW47gp0qvVW+4
         8ZZC7Vxjey8XoorHtC6I+LQdaMkpNwZmpSyXYY3gd22nMxuE72vpmTKXH6DM5gGY+I8Z
         BZtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=mF8rdEcxcKIShDOdEPom9nQ7TChCjeVx5jqE1kripiM=;
        b=SeIlulwCUTPujuRYC7AafEbLebYhzHpxc33yb+AvpnWnOCDD+845kw2mlSuc6ifKfJ
         0rQSSl6R+jL4X3YWGCBxPCCTbPQq+SyQIeKgO8fXVZ2LPhAtrqMg7YmIDwFseuuOfsvA
         78gc2UKhJpVVeKGoNk5NTkL4hrGQe0Y5jDJ9s7B3jeER2kuSSEKZaq79uBA3jCLUhRfB
         jjHvfXtW2rBXkTK8deO297pRuzkb2wkNqkGg8SFgnL8emMWoS4xz55Q3ZFxp49hV0XGr
         P3ad4q0tIb1y2aFhTXA9Pgk3ZssSiMKRMNboLpUyALQQUFPbIHUyYANoCs/wNBfrDT64
         DsLg==
X-Gm-Message-State: AOAM532CyEgOHlVhHQUML0S6YOsNI2HMkIMrAf4IU+SI4tvfrzYRhtZO
        qllk65H0PG09Zy4rpUoKKKC6yZ7nZuKu9MVOlPQSGkHtmL1mY29A
X-Google-Smtp-Source: ABdhPJxt7hno7eWNFo6kWfU9cXXgHtC7mWRl39q8fTjRVd6nnYFjwwCko6pqUyabEDJnoi3QSXgncmfiZ9df4cZOI8o=
X-Received: by 2002:adf:e607:: with SMTP id p7mr29741441wrm.93.1606763443306;
 Mon, 30 Nov 2020 11:10:43 -0800 (PST)
MIME-Version: 1.0
From:   Fritz Koenig <frkoenig@google.com>
Date:   Mon, 30 Nov 2020 11:10:31 -0800
Message-ID: <CAMfZQbyxZPENgRans0KS5sHTLCj1dXRMcE8ewyksoSNesaa+vA@mail.gmail.com>
Subject: Changing encoding properties
To:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When can bitrate, etc., be changed by VIDIOC_TRY_EXT_CTRLS?  Any time
during encode?  Only before VIDIOC_STREAMON?

My understanding is that VIDIOC_STREAMON should start actually
processing frames, everything before then is configuration.  If
something needs to be adjusted then VIDIOC_STREAMOFF should be called,
changes made, and then VIDIOC_STREAMON again.  Is this correct?

I didn't see anything in the documentation about this.

Thanks.

-Fritz
