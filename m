Return-Path: <linux-media+bounces-19078-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CB798FA3D
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 01:06:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D03D1C2302C
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 23:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF38A1CF7AB;
	Thu,  3 Oct 2024 23:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="n9JWBFSF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78E41CEAC5
	for <linux-media@vger.kernel.org>; Thu,  3 Oct 2024 23:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727996791; cv=none; b=By0oaapENyr0PmEG0o+t0ueyAz6J1B/uZfA2cG1ifTIGrajFysQF4rE9sKbs+YchCfTUSXprAdOYPI9nvVh9VDO59Y6vrHmb1FJXQdZDyqvipxxN0He3BqQR3SWkPVxCsRDR89CnzsS1ac7/zM5/n5ngph6O/9pk9jwI+qVxOn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727996791; c=relaxed/simple;
	bh=zRP3DEnD4GCppkLK82+gXUypy0jePh+4M6dYFqtzLW4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D/igrABifPi3QOVlxuxYxhNHaFRHNkTgn/iw1bfgbzRUHpmZGTda1sMT9iM3jXJc3m7dlPsYNbWFqVUJYKZu15n/iXtgCxM8IUMXCULm7HbAW8ydbKOBN/I85zuItkVQBcTl40vmUs8+aBToytc5F8FghoOZTIK4Cxye/JdBhL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=n9JWBFSF; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4585721f6edso10623491cf.2
        for <linux-media@vger.kernel.org>; Thu, 03 Oct 2024 16:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727996786; x=1728601586; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hn+GyEPxh6WVTNT/1U5nhBajGycIcSO0A3tJqd76F4U=;
        b=n9JWBFSFtWvm/pQTuEiDWYPLmL55cqXCCX/icDmS6tM3UoEqOGUHnsyqjzSGnLK9w1
         3iPzIFnx+ItTMHdSFsM85qXImijqjwvDMUCSiQ8d8YUsnwZVoeFWh/nqWrHrqXvrfpUT
         Bglr3zfKUHQ+eQYd8nO97dT+f2MzJvc9rMJLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727996786; x=1728601586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hn+GyEPxh6WVTNT/1U5nhBajGycIcSO0A3tJqd76F4U=;
        b=C9Z9LA1Zt2HXW78foMZR6iKGFbmjI5D+eH+PnizLr3jIWne2x9CCU+g8BVZv448Osx
         9/GXWHs6dH610k3Bi0BB+q79IgZrHdjqd8q2tM7dFUwXn85YrAtwPmTWCaTFf6jyu6Tm
         3OuGiKU49k/m6XUfuQ14sQrsibEwHOKiwF4y+fyzLyU1qfaQ8sUUZkq/8cXslp/cHACN
         4yumbU6uhWcOhHm512mRAHZXQv41XCtdsrmK/9KZKWfASOlqHor/tx8QOns7WOgoO783
         kNBEHHEfd+AUmtRNsQvpDruu0sO4uZ9q6ZqEBZybYZAGFW9HzSoaSjfPhCM5lTHAcD3G
         W1uQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmJCaPKYIJhwoQlbmwWaa14PcMkCItRlPGtaS6+YJJ80//Bjdw20h6H3ohxPYNZZ3Trq5aMo6EIz9yeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVFFXMDoVcoy/ob7EAVtDqwG06cxN4aYwPbGYlwc4rKErNH4lD
	dmhXHvkm9Uf2dMuaBdO1TH/Otsma85EDSJZC8PGD2oxMf+xHjLLTRHmb1vlf+bBjbUuNMWttXtq
	l7RTmeNe9QHS7Ci53+TBOLmkLbW7BDld/yn75
X-Google-Smtp-Source: AGHT+IF4OHc38Zx1Sv/11fNdxkf+OIlpkaEciQwVgGlLPuNfu4ed6p0KgQvWlq090czqkKI0pnppOvqaHh/FEzm3hSM=
X-Received: by 2002:a05:622a:548e:b0:45d:8bd7:391a with SMTP id
 d75a77b69052e-45d9bad3311mr11393611cf.43.1727996786236; Thu, 03 Oct 2024
 16:06:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240529-b4-media_docs_improve-v2-0-66318b2da726@collabora.com> <20240529-b4-media_docs_improve-v2-2-66318b2da726@collabora.com>
In-Reply-To: <20240529-b4-media_docs_improve-v2-2-66318b2da726@collabora.com>
From: Steve Cho <stevecho@chromium.org>
Date: Thu, 3 Oct 2024 16:06:15 -0700
Message-ID: <CAC-pXoP9n-SBCRbmnMiS3mCr4+GkTH-3+qv0E1DN52Y9GtpYKA@mail.gmail.com>
Subject: Re: [PATCH RFC v2 2/3] docs: Add guides section for debugging
To: Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com, 
	hverkuil-cisco@xs4all.nl, mauro.chehab@linux.intel.com, kernel@collabora.com, 
	bob.beckett@collabora.com, nicolas.dufresne@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Few minor comments.

On Tue, Sep 24, 2024 at 1:47=E2=80=AFAM Sebastian Fricke
<sebastian.fricke@collabora.com> wrote:
>
> This idea was formed after noticing that new developers experience
> certain difficulty to navigate within the multitude of different
> debugging options in the Kernel and while there often is good
> documentation for the tools, the developer has to know first that they
> exist and where to find them.
> Add a general debugging section to the Kernel documentation, as an
> easily locatable entry point to other documentation and as a general
> guideline for the topic.
>
> Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
> ---
>  .../driver_development_debugging_guide.rst         | 193 +++++++++++++++
>  Documentation/debugging/index.rst                  |  66 +++++
>  .../debugging/userspace_debugging_guide.rst        | 269 +++++++++++++++=
++++++
>  Documentation/index.rst                            |   2 +
>  4 files changed, 530 insertions(+)
>
> diff --git a/Documentation/debugging/driver_development_debugging_guide.r=
st b/Documentation/debugging/driver_development_debugging_guide.rst
> new file mode 100644
> index 000000000000..c750f63ac1d3
> --- /dev/null
> +++ b/Documentation/debugging/driver_development_debugging_guide.rst
> @@ -0,0 +1,193 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: <isonum.txt>
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Debugging advice for driver development
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This document serves as a general starting point and lookup for debuggin=
g device
> +drivers.
> +While this guide focuses on debugging that requires re-compiling the
> +module/kernel, the `userspace-debugging-guide <userspace_debugging_guide=
.html>`__
> +will guide you through tools like dynamic debug, ftrace and other tools =
useful
> +for debugging issues and behavior.
> +For general debugging advice, see `general-debugging-guide <index.html>`=
__.
> +
> +.. contents::
> +    :depth: 3
> +
> +Available tools
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Printk & friends
> +----------------
> +
> +These are derivatives of printf() with varying destinations and support =
for being dynamically turned on or off, or lack thereof.
> +
> +.. _printk:
> +
> +**Simple printk**
> +~~~~~~~~~~~~~~~~~
> +
> +The classic, can be used to great effect for quick and dirty development
> +of new modules or to extract arbitrary necessary data for troubleshootin=
g.
> +
> +Prerequisite: :code:`CONFIG_PRINTK` (usually enabled by default)
> +
> +**Pros**:
> +
> +- No need to learn anything, simple to use
> +- Easy to modify exactly to your needs (formatting of the data (See: `fo=
rmat specifiers <../core-api/printk-formats.html>`__), visibility in the lo=
g)
> +- Can cause delays in the execution of the code (beneficial to confirm w=
hether timing is a factor)
I experienced this too before, but isn't it generalizing too much here?
I mean it is not easy to observe timing issue with printk.

> +
> +**Cons**:
> +
> +- Requires rebuilding the kernel/module
> +- Can cause delays in the execution of the code (which can cause issues =
to be not reproducible)
> +
> +`Full documentation <../core-api/printk-basics.html>`__
> +
> +.. _trace_printk:
> +
> +**Trace_printk**
> +~~~~~~~~~~~~~~~~
> +
> +Prerequisite: :code:`CONFIG_DYNAMIC_FTRACE` & :code:`#include <linux/ftr=
ace.h>`
> +
> +It is a tiny bit less comfortable to use than `printk`_, because you wil=
l have
> +to read the messages from the trace file (See: `Reading the ftrace log
> +<userspace_debugging_guide.html#read-the-ftrace-log>`_ instead of from t=
he
> +kernel log, but very useful when printk adds unwanted delays into the co=
de
> +execution, causing issues to be flaky or hidden.)
> +
> +If the processing of this still causes timing issues then you can try `t=
race_puts()`.
> +
> +`Full Documentation <../driver-api/basics.html#c.trace_printk>`__
> +
> +**dev_dbg**
> +~~~~~~~~~~~
> +
> +Print statement, which can be target by `dynamic debug
nit: s/target/targeted

> +<userspace_debugging_guide.html#dynamic-debug>`__, that contains additio=
nal
> +information about the device used within the context.
> +
> +**When is it appropriate to leave a debug print in the code?**
> +
> +Permanent debug statements have to be useful for a developer to troubles=
hoot
> +driver misbehavior. Judging that is a bit more of an art than a science,=
 but
> +some guidelines are in the `Coding style guide
> +<../process/coding-style.html#printing-kernel-messages>`__.
> +
> +**Custom printk**
> +~~~~~~~~~~~~~~~~~
> +
> +Example:
> +::
> +
> +  #define core_dbg(fmt, arg...) do { \
> +         if (core_debug) \
> +                 printk(KERN_DEBUG pr_fmt("core: " fmt), ## arg); \
> +         } while (0)
> +
> +**When should you do this?**
> +
> +It is better to just use a `pr_debug()`, which can later be turned on/of=
f with
> +dynamic debug. Additionally, a lot of drivers activate these prints via =
a
> +variable like `core_debug` set by a module parameter. However, Module
> +parameters `are not recommended anymore
> +<https://lkml.org/lkml/2024/3/27/163>`_.
> +
> +Ftrace
> +------
> +
> +**Creating custom Ftrace tracepoint**
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Here is a basic description of `how to implement new tracepoints <../tra=
ce/tracepoints.html#usage>`__.
> +
> +`Full event tracing documentation <../trace/events.html>`__
> +
> +`Full Ftrace documentation <../trace/ftrace.html>`__
> +
> +DebugFS
> +-------
> +
> +Prerequisite: :code:`CONFIG_DEBUG_FS` & :code:`#include <linux/debugfs.h=
>`
> +
> +DebugFS differs from the other approaches of debugging, as it doesn't wr=
ite messages to the kernel log nor add traces to the code. Instead it allow=
s the developer to handle a set of files.
> +With these files you can either store values of variables or make regist=
er/memory dumps or you can make these files writable and modify values/sett=
ings in the driver.
> +Possible use-cases among others:
> +
> +- Store register values
> +- Keep track of variables
> +- Store errors
> +- Store settings
> +- Toggle a setting like debug on/off
> +- Error injection
> +
> +This is especially useful, when the size of a data dump would be hard to=
 digest as
> +part of the general kernel log (for example when dumping raw bitstream d=
ata) or
> +when you are not interested in all the values all the time, but with the
> +possibility to inspect them.
> +
> +The general idea is:
> +
> +- Create a directory during probe (`struct dentry *parent =3D debugfs_cr=
eate_dir("my_driver", NULL);`)
> +- Create a file (`debugfs_create_u32("my_value", 444, parent, &my_variab=
le);`)
> +
> +  - In this example the file is found in `/sys/kernel/debug/my_driver/my=
_value` (with read permissions for user/group/all)
> +  - any update of `my_variable` will update the value in the file
> +
> +- Clean up the folder when removing the device (`debugfs_remove_recursiv=
e(parent);`)
> +
> +`Full documentation <../filesystems/debugfs.html>`__
> +
> +.. _error_checking:
> +
> +KASAN, UBSAN, lockdep and other error checkers
> +----------------------------------------------
> +
> +KASAN (Kernel Address Sanitizer)
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +KASAN is a dynamic memory error detector that helps to find use-after-fr=
ee and
> +out-of-bounds bugs. It uses compile-time instrumentation to check every =
memory
> +access.
> +
> +`Full documentation <../dev-tools/kasan.html>`__
> +
> +UBSAN (Undefined Behavior Sanitizer)
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +UBSAN relies on compiler instrumentation and runtime checks to detect un=
defined
> +behavior. It is designed to find a variety of issues, including signed i=
nteger overflow,
> +array index out of bounds, and more.
> +
> +`Full documentation <../dev-tools/ubsan.html>`__
> +
> +lockdep (Lock Dependency Validator)
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +lockdep is a runtime lock dependency validator that detects potential de=
adlocks
> +and other locking-related issues in the kernel.
> +It tracks lock acquisitions and releases, building a dependency graph th=
at is
> +analyzed for potential deadlocks.
> +lockdep is especially useful for validating the correctness of lock orde=
ring in
> +the kernel.
> +
> +device coredump
> +---------------
> +
> +Prerequisite: :code:`#include <linux/devcoredump.h>`
> +
> +Provides infrastructure through which the driver can provide arbitrary d=
ata to
> +userland. It is most often used in conjunction with udev or similar user=
land
> +infrastructure to listen for the kernel uevents, which indicates the dum=
p is
> +ready. Udev then usually has rules to copy that file somewhere for long-=
term
> +storage and analysis as by default the data for the dump is automaticall=
y
nit: didn't understand. maybe intended s/as/and/ ?

> +cleaned up after 5 minutes.
> +That data is then analyzed with driver-specific tools or GDB.
> +
> +You can find an example implementation at: :code:`drivers/media/platform=
/qcom/venus/core.c`
> +
> +**Copyright** |copy| 2024 : Collabora
> diff --git a/Documentation/debugging/index.rst b/Documentation/debugging/=
index.rst
> new file mode 100644
> index 000000000000..7bdad2fa09e1
> --- /dev/null
> +++ b/Documentation/debugging/index.rst
> @@ -0,0 +1,66 @@
> +
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: <isonum.txt>
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +General debugging advice for Linux Kernel developers
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +   driver_development_debugging_guide
> +   userspace_debugging_guide
> +
> +.. only::  subproject and html
> +
> +   Indices
> +   =3D=3D=3D=3D=3D=3D=3D
> +
> +   * :ref:`genindex`
> +
> +General debugging advice
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Depending on the issue, a different set of tools is available to track d=
own the
> +problem or even to realize whether there is one in the first place.
> +
> +As a first step you have to figure out what kind of issue you want to de=
bug.
> +Depending on the answer, your methodology and choice of tools may vary.
> +
> +Do I need to debug with limited access?
> +---------------------------------------
> +
> +Do you have limited access to the machine or are you unable to stop the =
running execution?
> +
> +In this case your debugging capability depends on built-in debugging sup=
port of
> +provided distro kernel.
> +The `userspace debugging guide <userspace_debugging_guide.html>`__ provi=
des a
> +brief overview over range of possible debugging tools in that situation.=
 You
> +can check the capability of your kernel, in most cases, by looking into =
config
> +file within the /boot folder.
> +
> +Do I have root access to the system?
> +------------------------------------
> +
> +Are you easily able to replace the module in question or to install a ne=
w kernel?
> +
> +In that case your range of available tools is a lot bigger, you can find=
 the
> +tools `here <driver_development_debugging_guide.html>`__.
> +
> +Is timing a factor?
> +-------------------
> +
> +It is important to understand if the problem you want to debug manifests=
 itself
> +consistently (i.e. given a set of inputs you always get the same, incorr=
ect
> +output), or inconsistently. If it manifests itself inconsistently, some =
timing
> +factor might be at play. If inserting delays into the code does change t=
he
> +behavior, then quite likely timing is a factor.
> +
> +When timing does alter the outcome of the code execution using a simple =
`printk
> +<driver_development_debugging_guide.html#printk>`_ for debugging purpose=
s won't
> +work, a similar alternative is to use `trace_printk
> +<driver_development_debugging_guide.html#trace-printk>`_, which logs the=
 debug
> +messages to the trace file instead of the kernel log.
> +
> +**Copyright** |copy| 2024 : Collabora
> diff --git a/Documentation/debugging/userspace_debugging_guide.rst b/Docu=
mentation/debugging/userspace_debugging_guide.rst
> new file mode 100644
> index 000000000000..4d269a9ef913
> --- /dev/null
> +++ b/Documentation/debugging/userspace_debugging_guide.rst
> @@ -0,0 +1,269 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: <isonum.txt>
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> +Userspace debugging advice
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> +
> +A brief overview of common tools to debug the Linux Kernel from userspac=
e.
> +For debugging advice aimed at driver developer go `here <driver_developm=
ent_debugging_guide.html>`__.
> +For general debugging advice, see `general-debugging-guide <index.html>`=
__.
> +
> +.. contents::
> +    :depth: 3
> +
> +Available tools
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Dynamic debug
> +-------------
> +
> +Mechanism to filter what ends up in the kernel log by dis-/en-abling log
> +messages.
> +
> +Prerequisite: `CONFIG_DYNAMIC_DEBUG`
> +
> +.. _valid_dyndbg_prints:
> +
> +Dynamic debug is only able to target:
> +
> +- `pr_debug()`
> +- `dev_dbg()`
> +- `print_hex_dump_debug()`
> +- `print_hex_dump_bytes()`
> +
> +Therefore the usability of this tool is quite limited in the media subsy=
stem,
> +because, as of now, there is no uniform rule for adding debug prints to =
the codebase,
> +resulting in a variety of ways these prints are implemented.
Shouldn't this explanation and some examples below go to the media
specific document instead of here?
Some parts in this patch are tricky to decide where to go, but
suggesting to review once again.

> +
> +Also, note that most debug statements are implemented as a variation of
> +`dprintk`, which have to be activated via a parameter in respective modu=
le,
> +dynamic debug is unable to do that step for you.
> +
> +Here is one example, that enables all available `pr_debug()`'s within th=
e file:
> +::
> +
> +  $ alias ddcmd=3D'echo $* > /proc/dynamic_debug/control'
> +  $ ddcmd '-p; file v4l2-h264.c +p'
> +  $ grep =3Dp /proc/dynamic_debug/control
> +   drivers/media/v4l2-core/v4l2-h264.c:372 [v4l2_h264]print_ref_list_b =
=3Dp "ref_pic_list_b%u (cur_poc %u%c) %s"
> +   drivers/media/v4l2-core/v4l2-h264.c:333 [v4l2_h264]print_ref_list_p =
=3Dp "ref_pic_list_p (cur_poc %u%c) %s\n"
> +
> +**When should you use this over** `Ftrace`_ **?**
> +
> +- When the code contains one of the :ref:`valid print statements <valid_=
dyndbg_prints_>`_ or when you have added multiple pr_debug() statements dur=
ing development
> +- When timing is not an issue, meaning if multiple `pr_debug()` statemen=
ts in the code won't cause delays
> +- When you care more about receiving specific log messages than tracing =
the pattern of how a function is called
> +
> +`Full documentation <../admin-guide/dynamic-debug-howto.html>`__
> +
> +Ftrace
> +------
> +
> +Prerequisite: :code:`CONFIG_DYNAMIC_FTRACE`
> +
> +Trace whenever the a file is opened:
> +::
> +
> +  $ cd /sys/kernel/tracing
> +  $ echo function > /sys/kernel/tracing/current_tracer
> +  $ echo do_filep_open > set_ftrace_filter
> +  $ echo 1 > tracing_on
> +  $ cat trace
> +       find-4624    [005] ...1. 580781.888166: do_filp_open <-do_sys_ope=
nat2
> +       find-4624    [005] ...1. 580781.888237: do_filp_open <-do_sys_ope=
nat2
> +       find-4624    [005] ...1. 580781.888361: do_filp_open <-do_sys_ope=
nat2
> +
> +.. _event_tracing:
> +
> +Activate a ftrace event on top of that:
> +::
> +
> +  $ echo 1 > events/kmem/kfree/enable
> +       find-5351    [005] ...1. 678288.910143: do_filp_open <-do_sys_ope=
nat2
> +       find-5351    [005] ..... 678288.910185: kfree: call_site=3Dfscryp=
t_fname_free_buffer+0x28/0x48 ptr=3D0000000000000000
> +       find-5351    [005] ...1. 678288.910218: do_filp_open <-do_sys_ope=
nat2
> +       find-5351    [005] ..... 678288.910260: kfree: call_site=3Dfscryp=
t_fname_free_buffer+0x28/0x48 ptr=3D0000000000000000
> +       find-5351    [005] ...1. 678288.910293: do_filp_open <-do_sys_ope=
nat2
> +       find-5351    [005] ..... 678288.910345: kfree: call_site=3Dfscryp=
t_fname_free_buffer+0x28/0x48 ptr=3D0000000000000000
> +       find-5351    [005] ..... 678288.910389: kfree: call_site=3Dfree_r=
b_tree_fname+0x54/0x88 ptr=3D000000007ba73e40
> +       find-5351    [005] ..... 678288.910390: kfree: call_site=3Dfree_r=
b_tree_fname+0x54/0x88 ptr=3D000000009e4850bc
> +       find-5351    [005] ..... 678288.910391: kfree: call_site=3Dfree_r=
b_tree_fname+0x54/0x88 ptr=3D000000004156f20f
> +       find-5351    [005] ..... 678288.910393: kfree: call_site=3Dfree_r=
b_tree_fname+0x54/0x88 ptr=3D00000000c7207e20
> +       find-5351    [005] ..... 678288.910394: kfree: call_site=3Dfree_r=
b_tree_fname+0x54/0x88 ptr=3D0000000037c31d76
> +       find-5351    [005] ..... 678288.910395: kfree: call_site=3Dfree_r=
b_tree_fname+0x54/0x88 ptr=3D0000000001922677
> +
> +.. _read_ftrace_log:
> +
> +**Reading the ftrace log**
> +~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +The `trace` file can be read just like any other file (`cat`, `tail`, `h=
ead`,
> +`vim`, etc.), the size of the file is limited by the `buffer_size_kb` (`=
`echo
> +1000 > buffer_size_kb``). The `trace_pipe` will behave similar to the `t=
race`
> +file, but whenever you read from the file the content is consumed.
> +
> +**Kernelshark**
> +~~~~~~~~~~~~~~~
> +
> +A GUI interface to visualize the traces as a graph and list view from th=
e
> +output of the `trace-cmd
> +<https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git/>`__ appli=
cation.
> +
> +`Kernelshark documentation <https://kernelshark.org/Documentation.html>`=
_
> +
> +`Full Ftrace documentation <../trace/ftrace.html>`__
> +
> +Perf & alternatives
> +-------------------
> +
> +The tools mentioned above provide ways to inspect kernel code, results, =
variable values, etc.
> +Sometimes you have to find out first where to look and for those cases a=
 box of performance tracking tools can help you to frame the issue.
nit: add comma. better readability.
s/and for those cases /and for those cases, /

> +
> +.. _performance:
> +
> +**Why should you do a performance analysis?**
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +A performance analysis is a good first step when among other reasons:
> +
> +- you cannot define the issue
> +- you do not know where it occurs
> +- the running system should not be interrupted or it is a remote system,=
 where you cannot install a new module/kernel
> +
> +.. _linux-tools:
> +
> +**How to do a simple analysis with linux tools?**
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +For the start of a performance analysis, you can start with the usual to=
ols like:
> +
> +- `top` / `htop` / `atop` (*get an overview of the system load, see spik=
es on specific processes*)
> +- `mpstat -P ALL` (*look at the load distribution among CPUs*)
> +- `iostat -x` (*observe input and output devices utilization and perform=
ance*)
> +- `vmstat` (*overview of memory usage on the system*)
> +- `pidstat` (*similar to* `vmstat` *but per process, to dial it down to =
the target*)
> +- `strace -tp $PID` (*once you know the process, you can figure out how =
it communicates with the Kernel*)
> +
> +These should help to figure out restrict the areas to look at sufficient=
ly.
nit: s/figure out restrict/narrow down/

> +
> +**Diving deeper with perf**
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +The **perf** tool provides a series of metrics and events to further dia=
l down on issues.
> +
> +Prerequisite: build or install perf on your system
> +
> +Gather statistics data for finding all files starting with `gcc` in `/us=
r`
> +::
> +
> +       # perf stat -d find /usr -name 'gcc*' | wc -l
> +
> +        Performance counter stats for 'find /usr -name gcc*':
> +
> +                  1277.81 msec task-clock                       #    0.9=
97 CPUs utilized
> +                        9      context-switches                 #    7.0=
43 /sec
> +                        1      cpu-migrations                   #    0.7=
83 /sec
> +                      704      page-faults                      #  550.9=
43 /sec
> +                766548897      cycles                           #    0.6=
00 GHz                         (97.15%)
> +                798285467      instructions                     #    1.0=
4  insn per cycle              (97.15%)
> +                 57582731      branches                         #   45.0=
64 M/sec                       (2.85%)
> +                  3842573      branch-misses                    #    6.6=
7% of all branches             (97.15%)
> +                281616097      L1-dcache-loads                  #  220.3=
90 M/sec                       (97.15%)
> +                  4220975      L1-dcache-load-misses            #    1.5=
0% of all L1-dcache accesses   (97.15%)
> +          <not supported>      LLC-loads
> +          <not supported>      LLC-load-misses
> +
> +              1.281746009 seconds time elapsed
> +
> +              0.508796000 seconds user
> +              0.773209000 seconds sys
> +
> +
> +       52
> +
> +The availability of events and metrics depends on the system you are run=
ning.
> +
> +`Full documentation <https://perf.wiki.kernel.org/index.php/Main_Page>`_=
_
> +
> +**Perfetto**
> +~~~~~~~~~~~~
> +
> +A set of tools to measure and analyze how well applications and systems =
perform.
> +You can use it to:
> +
> +* identify bottlenecks
> +* optimize code
> +* make software run faster and more efficiently.
> +
> +**What is the difference between perfetto and perf?**
> +
> +* perf is tool as part of and specialized for the Linux Kernel and has C=
LI user
> +  interface.
> +* perfetto cross-platform performance analysis stack, has extended
> +  functionality into userspace and provides a WEB user interface.
> +
> +`Full documentation <https://perfetto.dev/docs/>`__
> +
> +.. _kernel_panic_analysis_tools:
> +
> +Kernel panic analysis tools
> +---------------------------
> +
> +  To analyse the crash dump please use `Kdump` & `Kexec`.
> +
> +  `Full documentation <../admin-guide/kdump/kdump.html>`__
> +
> +  In order to find the corresponding line in the code you can use `faddr=
2line
> +  <https://elixir.bootlin.com/linux/latest/source/scripts/faddr2line>`__=
, note
> +  that you need to enable `CONFIG_DEBUG_INFO` for that to work.
> +
> +  An alternative to using `faddr2line` is the use of `objdump` (and it's
> +  derivatives for the different platforms like `aarch64-linux-gnu-objdum=
p`),
> +  take this line as an example:
> +
> +  `[  +0.000240]  rkvdec_device_run+0x50/0x138 [rockchip_vdec]`.
> +
> +  We can find the corresponding line of code by executing:
> +  ::
> +
> +    aarch64-linux-gnu-objdump -dS drivers/staging/media/rkvdec/rockchip-=
vdec.ko | grep rkvdec_device_run\>: -A 40
> +    0000000000000ac8 <rkvdec_device_run>:
> +     ac8:      d503201f        nop
> +     acc:      d503201f        nop
> +    {
> +     ad0:      d503233f        paciasp
> +     ad4:      a9bd7bfd        stp     x29, x30, [sp, #-48]!
> +     ad8:      910003fd        mov     x29, sp
> +     adc:      a90153f3        stp     x19, x20, [sp, #16]
> +     ae0:      a9025bf5        stp     x21, x22, [sp, #32]
> +        const struct rkvdec_coded_fmt_desc *desc =3D ctx->coded_fmt_desc=
;
> +     ae4:      f9411814        ldr     x20, [x0, #560]
> +        struct rkvdec_dev *rkvdec =3D ctx->dev;
> +     ae8:      f9418015        ldr     x21, [x0, #768]
> +        if (WARN_ON(!desc))
> +     aec:      b4000654        cbz     x20, bb4 <rkvdec_device_run+0xec>
> +        ret =3D pm_runtime_resume_and_get(rkvdec->dev);
> +     af0:      f943d2b6        ldr     x22, [x21, #1952]
> +        ret =3D __pm_runtime_resume(dev, RPM_GET_PUT);
> +     af4:      aa0003f3        mov     x19, x0
> +     af8:      52800081        mov     w1, #0x4                        /=
/ #4
> +     afc:      aa1603e0        mov     x0, x22
> +     b00:      94000000        bl      0 <__pm_runtime_resume>
> +        if (ret < 0) {
> +     b04:      37f80340        tbnz    w0, #31, b6c <rkvdec_device_run+0=
xa4>
> +        dev_warn(rkvdec->dev, "Not good\n");
> +     b08:      f943d2a0        ldr     x0, [x21, #1952]
> +     b0c:      90000001        adrp    x1, 0 <rkvdec_try_ctrl-0x8>
> +     b10:      91000021        add     x1, x1, #0x0
> +     b14:      94000000        bl      0 <_dev_warn>
> +        *bad =3D 1;
> +     b18:      d2800001        mov     x1, #0x0                        /=
/ #0
> +     ...
> +
> +
> +  To find the matching line we just have to add `0x50` (from
> +  `rkvdec_device_run+0x50`) to `0xac8` (from `0000000000000ac8
> +  <rkvdec_device_run>:`), which yields `0xb18` corresponding with `*bad =
=3D 1`.
I didn't understand this part. Can you explain?

> +
> +**Copyright** |copy| 2024 : Collabora
> diff --git a/Documentation/index.rst b/Documentation/index.rst
> index f9f525f4c0dd..eb8de7ba8e41 100644
> --- a/Documentation/index.rst
> +++ b/Documentation/index.rst
> @@ -57,6 +57,7 @@ Various other manuals with useful information for all k=
ernel developers.
>     Testing guide <dev-tools/testing-overview>
>     Hacking guide <kernel-hacking/index>
>     Tracing <trace/index>
> +   Debugging <debugging/index>
>     Fault injection <fault-injection/index>
>     Livepatching <livepatch/index>
>     Rust <rust/index>
> @@ -76,6 +77,7 @@ developers seeking information on the kernel's user-spa=
ce APIs.
>     Build system <kbuild/index>
>     Reporting issues <admin-guide/reporting-issues.rst>
>     Userspace tools <tools/index>
> +   Userspace debugging tools <debugging/userspace_debugging_guide.rst>
>     Userspace API <userspace-api/index>
>
>  See also: the `Linux man pages <https://www.kernel.org/doc/man-pages/>`_=
,
>
> --
> 2.25.1
>

