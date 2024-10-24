Return-Path: <linux-media+bounces-20277-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4019AF54B
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 00:21:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C3291C20F3B
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 22:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40AE8217912;
	Thu, 24 Oct 2024 22:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="WCysBASp"
X-Original-To: linux-media@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E43922B66F;
	Thu, 24 Oct 2024 22:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729808454; cv=none; b=gGOG5TJCl/Nqfb9/DMP9ORzLO4Wm+D0xCbGE0QcGK2rmFWBWWbgVd6H2LiUTnP3jMQlREmwaPgXZCbLL0LR9SlAIA3b2eyTxhoqSBk0PEePurNtdE1ncNYbiQhfVOL3sxRQMt/jWtp7w8x5I2P9grxGd59nqEvxr8oZJtoyrIfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729808454; c=relaxed/simple;
	bh=txxzYTcXG3lNM5aeb6tHJdH/SfxECQsKX08gRDvBfPk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oqXdTWiCK7/eE4MLg1kr45QSby32tV4WYv3Jynhc2dHYN3Yolo3hfnqpBRilmQlLuroYogMK3eUFAeb/xWulrh4E4dE+jKg9RhYLUBiAkdP0qD8tWVl9K3aiOPPNlUpZlJY53xEZ0G4bi2SL6zmNAcFIBRqKmVjtZaO/mnbzEG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=WCysBASp; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9C68E42C06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1729808450; bh=PVzTQbovFRUQFAqNGAZ2VuNY4GoHyJaQG8IgVREo3bA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=WCysBASpPVUW44xPGYz3F7R/DHkfIPLhM3LN3krY4vGyi2vRgj3Ym+SgAKK2Us2jO
	 H8M1XSlSjYJt/bUgpZGy90zxWqDtnE4Rf2rF37HDhLfENLlw+OXnUwnH9E1Sgi0o26
	 uwqUy00g/RuzJn+S58as4LJcONfI9DiuwzHM9nqlHvHbr+c4HC9LiyBzEOFKagwz8I
	 gIKooLmnr9yEqUPZZIr6UG5lg9aOhvi34Mn4NqT0tq2VrZK6p2i3C2mL9kBrniQ64D
	 AwSjg7UuEasPiL9zydlQaXvtMJKqmyeSRXLus0kCf33mQ8dF9lYzPE2VgIiGF85TNd
	 C+bUj7LrS614A==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 9C68E42C06;
	Thu, 24 Oct 2024 22:20:50 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil-cisco@xs4all.nl, mauro.chehab@linux.intel.com,
 kernel@collabora.com, bob.beckett@collabora.com,
 nicolas.dufresne@collabora.com, Sebastian Fricke
 <sebastian.fricke@collabora.com>
Subject: Re: [PATCH RFC v2 2/3] docs: Add guides section for debugging
In-Reply-To: <20240529-b4-media_docs_improve-v2-2-66318b2da726@collabora.com>
References: <20240529-b4-media_docs_improve-v2-0-66318b2da726@collabora.com>
 <20240529-b4-media_docs_improve-v2-2-66318b2da726@collabora.com>
Date: Thu, 24 Oct 2024 16:20:49 -0600
Message-ID: <877c9x2ldq.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Sebastian Fricke <sebastian.fricke@collabora.com> writes:

Mostly low-level comments here; the organizational comments I made
before also apply, of course.

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

I hadn't realized how many people have gone nuts with that file.  I
wouldn't be surprised to learn that it slows the build measurably at
this point, all so that we can say |copy|...  Maybe I'll go through and
replace all that with a simple =C2=A9 someday.

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

You can refer to another file just by its name; say
Documentation/process/debugging/userspace_debugging_guide.rst and the
right things will happen.

People reading the text files aren't looking for HTML files, so we
really don't want to make internal links that way.

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

Do you really need this label?  That's a pretty general term to put into
a global namespace.

> +**Simple printk**
> +~~~~~~~~~~~~~~~~~

Why the ** markup?  It's already a section head

> +The classic, can be used to great effect for quick and dirty development
> +of new modules or to extract arbitrary necessary data for troubleshootin=
g.
> +
> +Prerequisite: :code:`CONFIG_PRINTK` (usually enabled by default)

No need to clutter things with :code:; just say `CONFIG_PRINTK` (or even
leave out the literal markup entirely).

> +**Pros**:
> +
> +- No need to learn anything, simple to use
> +- Easy to modify exactly to your needs (formatting of the data (See: `fo=
rmat specifiers <../core-api/printk-formats.html>`__), visibility in the lo=
g)
> +- Can cause delays in the execution of the code (beneficial to confirm w=
hether timing is a factor)
> +
> +**Cons**:
> +
> +- Requires rebuilding the kernel/module
> +- Can cause delays in the execution of the code (which can cause issues =
to be not reproducible)
> +
> +`Full documentation <../core-api/printk-basics.html>`__

Documentation/core-api/printk-basics.rst

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

Say printk() with parentheses, and the build process will recognize it
and make an automatic link to the documentation; that would be good to
do throughout.

> +execution, causing issues to be flaky or hidden.)
> +
> +If the processing of this still causes timing issues then you can try `t=
race_puts()`.

...but do it without `literal` markup, let the build system do it.

> +`Full Documentation <../driver-api/basics.html#c.trace_printk>`__
> +
> +**dev_dbg**
> +~~~~~~~~~~~
> +
> +Print statement, which can be target by `dynamic debug
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

This can be just "Example::" - good to fix throughout.

> +  #define core_dbg(fmt, arg...) do { \
> +	  if (core_debug) \
> +		  printk(KERN_DEBUG pr_fmt("core: " fmt), ## arg); \
> +	  } while (0)
> +
> +**When should you do this?**
> +
> +It is better to just use a `pr_debug()`, which can later be turned on/of=
f with
> +dynamic debug. Additionally, a lot of drivers activate these prints via a
> +variable like `core_debug` set by a module parameter. However, Module
> +parameters `are not recommended anymore
> +<https://lkml.org/lkml/2024/3/27/163>`_.

Use lore links, please

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
> +storage and analysis as by default the data for the dump is automatically
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

This is supposed to be the general user-space debugging guide, so the
"media" reference doesn't quite fit.

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
> +	find-4624    [005] ...1. 580781.888166: do_filp_open <-do_sys_openat2
> +	find-4624    [005] ...1. 580781.888237: do_filp_open <-do_sys_openat2
> +	find-4624    [005] ...1. 580781.888361: do_filp_open <-do_sys_openat2
> +
> +.. _event_tracing:

It seems we're kind of duplicating some of the ftrace documentation at
this point?  Duplicate docs have the same problems as duplicate code -
they get out of sync and are best avoided.

Also, *please* resist the temptation to add labels everywhere.

Stopping here; I think this should be enough to get started with.

Thanks for working on this, I think it could turn into useful material
to have.

jon

